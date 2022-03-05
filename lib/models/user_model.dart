part of '../../repositories/database_repository/database_repository.dart';

class UserModel{
  final String uid;
  final String phone;
  final String name;
  final String imageUrl;
  final int accessMemory;
  final List<AudioModel> audios;

  UserModel({
    required this.uid,
    required this.phone,
    required this.name,
    required this.imageUrl,
    required this.accessMemory,
    required this.audios,
  });

  factory UserModel.initial() {
    return UserModel(
      uid: "",
      phone: '',
      name: '',
      accessMemory: 0,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFUQ2rBPChgUFxCPq6Sm9B86pEm-xAe1QSwnog9Gsjj6ZIrvi9lPOr0pDoNj5SeUsR45Y&usqp=CAU',
      audios: [],
    );
  }

  UserModel copyWith({
    String? uid,
    String? phone,
    String? name,
    String? imageUrl,
    int? accessMemory,
    List<AudioModel>? audios,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      audios: audios ?? this.audios,
      accessMemory: accessMemory ?? this.accessMemory,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return '\n********************************\n'
        '--- UserModel ---'
        '\n>> uid: $uid'
        '\n>> name: $name'
        '\n>> phone: $phone'
        '\n>> imageURL: $imageUrl'
        '\n>> accessMemory: $accessMemory'
        '\n>> audio: ${audios.length}'
        '\n********************************\n';
  }
}
