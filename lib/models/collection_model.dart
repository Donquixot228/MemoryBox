class CollectionsModel {
  final String image;
  final String name;
  final String displayName;
  final String descriptions;

  CollectionsModel({
    required this.image,
    required this.name,
    required this.displayName,
    required this.descriptions,
  });

  factory CollectionsModel.fromJson(Map<String, dynamic> json) {
    return CollectionsModel(
      image: json['image'],
      name: json['name'],
      displayName: json['displayName'],
      descriptions: json['descriptions'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'descriptions': descriptions,
        'displayName': displayName
      };
}
