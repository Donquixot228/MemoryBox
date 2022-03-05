import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memorybox2/models/collection_model.dart';

class CollectionsRepository {
  final _fireBaseStore = FirebaseFirestore.instance.collection('users');
  final firebaseUser = FirebaseAuth.instance.currentUser;

  // Create a new Collection -- [START]
  Future<void> createNewCollection({
    required String name,
    required String descriptions,
    required String image,
  }) async {
    CollectionsModel collectionsModel = CollectionsModel(
      image: image,
      name: name,
      displayName: name,
      descriptions: descriptions,
    );
    _fireBaseStore
        .doc(firebaseUser!.uid)
        .collection('collections')
        .doc(name)
        .set(collectionsModel.toJson());
  }

// Create a new Collection -- [END]
// Upload Image of Collection (ulpoad to storage and after to the base) --[START]

  Future<String> uploadCollectionImage({
    required File file,
    required String nameCollection,
  }) async {
    final _refDestination = FirebaseStorage.instance
        .ref('users/${firebaseUser!.uid}/collection-photo/$nameCollection');
    UploadTask? task = _refDestination.putFile(file);
    final taskResult = await task.whenComplete(() {});
    String urlPicture = await taskResult.ref.getDownloadURL();
    return urlPicture;
  }

  Future<void> updateCollectionImage(String nameCollection,String urlPicture)async{
     await _fireBaseStore
        .doc(firebaseUser!.uid)
        .collection('collections')
        .doc()
        .update({'imageUrl': urlPicture});
  }

// Upload Image of Collection (ulpoad to storage and after to the base) --[END]

//
  Future<void> updateCollectionName({
    required String nameCollection,
    required String displayName,
  }) async {
    await _fireBaseStore
        .doc(firebaseUser!.uid)
        .collection('collections')
        .doc(nameCollection)
        .update({'displayName': displayName});
  }

  Future<void> updateCollectionDescription({
    required String nameCollection,
    required String displayName,
  }) async {
    await _fireBaseStore
        .doc(firebaseUser!.uid)
        .collection('collections')
        .doc(nameCollection)
        .update({'descriptions': displayName});
  }


}
