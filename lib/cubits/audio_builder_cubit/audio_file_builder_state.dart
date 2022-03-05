part of 'audio_file_builder_cubit.dart';

class AudioFileBuilderState {
  final String searchKey;

  AudioFileBuilderState({
    required this.searchKey,
  });

  factory AudioFileBuilderState.initial() {
    return AudioFileBuilderState(
      searchKey: '',
    );
  }

  AudioFileBuilderState copyWith({
    String? searchKey,
  }) {
    return AudioFileBuilderState(
      searchKey: searchKey ?? this.searchKey,
    );
  }
}
