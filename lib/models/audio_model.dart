class AudioModel {
  final String uid;
  final String audioName;
  final String audioUrl;
  final String duration;
  final String searchKey;
  final List collections;

  AudioModel({
    required this.uid,
    required this.audioName,
    required this.audioUrl,
    required this.duration,
    required this.searchKey,
    required this.collections,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
        uid: json['uid'],
        searchKey: json['searchKey'],
        audioName: json['audioName'],
        audioUrl: json['audioUrl'],
        collections: json['collections'],
        duration: json['duration']);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'audioName': audioName,
        'audioUrl': audioUrl,
        'collections': collections,
        'duration': duration,
        'searchKey': searchKey
      };
}
