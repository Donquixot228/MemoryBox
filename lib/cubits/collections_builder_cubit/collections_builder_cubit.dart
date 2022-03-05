import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:memorybox2/repositories/collections_repository/collections_repository.dart';

part 'collections_builder_state.dart';

class CollectionsBuilderCubit extends Cubit<CollectionsBuilderState> {
  CollectionsBuilderCubit() : super(CollectionsBuilderState.initial());

  final CollectionsRepository _collectionsRepository = CollectionsRepository();

// Create Collection --[START]
  Future<void> createCollection() async {}

// Create Collection --[END]

// Upload Image of Collection (ulpoad to storage and after to the base) --[START]
  Future<void> uploadCollectionImage({
    required File file,
  }) async {
    String _imageUrl = await _collectionsRepository.uploadCollectionImage(
      file: file,
      nameCollection: state.collectionName
    );
    emit(state.copyWith(imageUrl: _imageUrl));
  }

//Upload Image of Collection (upload to storage and after to the base) --[END]
  Future<void> setCollectionName(String collectionName) async {
     emit(state.copyWith(collectionName: collectionName));
  }
  Future<void> setCollectionDescription(String collectionDescription) async {
    emit(state.copyWith(collectionDescription: collectionDescription));
  }

}
