part of 'collections_builder_cubit.dart';

class CollectionsBuilderState {
  Map<String, bool>? collectionMap;
  final bool selected;
  final String imageUrl;
  final String collectionName;
  final String collectionDescription;

  CollectionsBuilderState({
    required this.collectionName,
    this.collectionMap,
    required this.selected,
    required this.imageUrl,
    required this.collectionDescription,
  });

  factory CollectionsBuilderState.initial() {
    return CollectionsBuilderState(
      collectionDescription: '',
      collectionName: '',
      collectionMap: {},
      selected: false,
      imageUrl: '',
    );
  }

  CollectionsBuilderState copyWith({
    bool? selected,
    String? imageUrl,
    String? collectionName,
    String? collectionDescription,
  }) {
    return CollectionsBuilderState(
      collectionDescription:
          collectionDescription ?? this.collectionDescription,
      collectionName: collectionName ?? this.collectionName,
      selected: selected ?? this.selected,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
