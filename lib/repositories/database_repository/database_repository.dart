import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/models/audio_model.dart';
import 'package:path/path.dart';

import '../../models/audio_model.dart';

part '../../models/user_model.dart';

class DataBaseRepository extends Cubit<UserModel> {
  DataBaseRepository() : super(UserModel.initial());
  final AudioFileBuilder _audioFileBuilder = AudioFileBuilder();
// -- Generate Instance of Collection --
  final _fireBaseStore = FirebaseFirestore.instance.collection('users');
  final firebaseUser = FirebaseAuth.instance.currentUser;


  // -- GET and Set  USER INFO FROM FB to the USERMODEL  (Загружаем инфу и при помощи копивиз
  // меняем стейт USermodel, также  берем из фб список записей и перед тем как передать можно отфильтровать их)

  Future<void> getUserInfoFromFB() async {

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _fireBaseStore.doc(firebaseUser!.uid).collection('audios').get();

    DocumentSnapshot map = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .get();
    emit(state.copyWith(
      audios: _audioFileBuilder.audioFromSnap(snapshot),
      imageUrl: map['imageUrl'],
      name: map['name'],
      phone: map['phone'],
      accessMemory: map['accessMemory'],
      uid: map['uid'],
    ));
    log(state.toString());
  }
  Future<void> updateAudioListInUserModel() async{
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _fireBaseStore.doc(firebaseUser!.uid).collection('audios').get();
    emit(state.copyWith(audios: _audioFileBuilder.audioFromSnap(snapshot)));
  }

  // -- Set NEW User info to the FB or if we have the data we start getUserInfoFromFB()
  // This method we use after USer enter pin (SPLASH_AFTER_PIN_ENTER)

  Future<void> setNewUserInfoToFB() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      _fireBaseStore.doc(firebaseUser.uid).set({
        "uid": firebaseUser.uid,
        "name": firebaseUser.displayName,
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFUQ2rBPChgUFxCPq6Sm9B86pEm-xAe1QSwnog9Gsjj6ZIrvi9lPOr0pDoNj5SeUsR45Y&usqp=CAU',
        'accessMemory': 0,
        'phone': firebaseUser.phoneNumber,
      }).then((_) => log('Success set'));
      // _fireBaseStore.doc(firebaseUser.uid).collection('audios').doc();

      emit(
        state.copyWith(
            uid: firebaseUser.uid,
            phone: firebaseUser.phoneNumber,
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFUQ2rBPChgUFxCPq6Sm9B86pEm-xAe1QSwnog9Gsjj6ZIrvi9lPOr0pDoNj5SeUsR45Y&usqp=CAU'),
      );
    }
  }

  //-- Update some data in the FB

  Future<void> updateSomeData({
    required String fieldName,
    required String data,
  }) async {
    await _fireBaseStore.doc(state.uid).update({fieldName: data});
  }

  //- [START]Update UserName in FB and UserModel

  Future<void> updateUserName({
    required String data,
  }) async {
    await _fireBaseStore.doc(state.uid).update({'name': data});
    emit(state.copyWith(name: data));
  }

  //  - [START]Update UserPhone in FB and UserModel

  Future<void> updateUserPhone({
    required String phone,
  }) async {
    await _fireBaseStore.doc(state.uid).update({'phone': phone});
    emit(state.copyWith(phone: phone));
  }

  //-- [START] Update UserPhoto in FB And UserModel

  Future<void> updateUserPhoto({
    required File file,
  }) async {
    //p.basename('path/to/'); // -> 'to'
    final _refDestination = FirebaseStorage.instance
        .ref('users/${state.uid}/photo/${basename(file.path)}');
    //Upload to STORAGE FILE-PATH - Загружаем в бд(storage) наш файл точнее его путь file.path
    UploadTask? task = _refDestination.putFile(file);

    //Get TaskSnapshot - получаем Снимок нашей операции (snapshot)
    final taskResult = await task.whenComplete(() {});

    // Get Photo (urlPath) from our snapshot(taskResult) - на основе taskResult получем url фотки из storage
    String urlPicture = await taskResult.ref.getDownloadURL();

    // Update photo url address in FIRESTORE DATABASE - обновляем нашу пользовательскую инфу, а именно ячейку imageUrl
    await _fireBaseStore.doc(state.uid).update({'imageUrl': urlPicture});

    //Update our UserModel state - обновляем состояние нашей модели (переменную imageUrl)
    emit(state.copyWith(imageUrl: urlPicture));
  }

//Update UserPhoto in FB And UserModel  -- [END]

// -- Clear All USERSINFO

  Future<void> clearAllDataInFB() async {
    final _refDestination = FirebaseStorage.instance.ref('${state.uid}');
    await _fireBaseStore.doc(state.uid).delete();
    _refDestination.delete();
  }





}
