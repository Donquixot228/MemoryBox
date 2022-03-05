import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memorybox2/models/audio_model.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

part 'audio_file_builder_state.dart';

class AudioFileBuilder extends Cubit<AudioFileBuilderState> {
  AudioFileBuilder() : super(AudioFileBuilderState.initial());

  final _fireBaseStore = FirebaseFirestore.instance.collection('users');
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final Uuid _uuid = const Uuid();


  Future<void> changeSearchKey({required String searchKey})async{
    emit(state.copyWith(searchKey: searchKey));
  }

  Stream<List<AudioModel>> searchAudio(String searchKey) {
    return _fireBaseStore
        .doc(firebaseUser!.uid)
        .collection('audios')
        .where('searchKey', isGreaterThanOrEqualTo: searchKey.toLowerCase())
        .where('searchKey', isLessThan: searchKey.toLowerCase() + '\uf8ff')
        .snapshots()
        .map(audioFromSnap);
  }

  List<AudioModel> audioFromSnap(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => AudioModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  //add Audio file to the Firestore -- [START]
  Future<void> addAudioFileToFireStore(
      String audioName, String filePath, String duration) async {
    final _firebaseUser = FirebaseAuth.instance.currentUser;
    Reference _refStorageDestination = FirebaseStorage.instance
        .ref('users/${_firebaseUser!.uid}/audio/${basename(filePath)}');

    UploadTask? task = _refStorageDestination.putFile(File(filePath));
    final taskResult = await task.whenComplete(() {});
    String urlAudio = await taskResult.ref.getDownloadURL();

    final String _id = _uuid.v1();

    AudioModel audio = AudioModel(
      uid: _id,
      audioName: audioName,
      audioUrl: urlAudio,
      duration: duration,
      searchKey: audioName.toLowerCase(),
      collections: [],
    );
    _fireBaseStore
        .doc(_firebaseUser.uid)
        .collection('audios')
        .doc(_id)
        .set(audio.toJson());
  }

//add Audio file to the Firestore -- [END]




}
