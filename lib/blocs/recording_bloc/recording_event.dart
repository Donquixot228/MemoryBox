part of 'recording_bloc.dart';

abstract class RecordingEvent {
  const RecordingEvent();
}

class OpenSession extends RecordingEvent {}

class StartRecorder extends RecordingEvent {}

class WriteFileToStorage extends RecordingEvent {}

class StopRecorder extends RecordingEvent {}

class GetFileFromStorage extends RecordingEvent {}

class CancelRecording extends RecordingEvent {}

class PauseAudioFile extends RecordingEvent {}

class PlayAudioFile extends RecordingEvent {}

class PlayListAudioFile extends RecordingEvent {
  String url;

  PlayListAudioFile(this.url);
}

class ResumeAudioFile extends RecordingEvent {}

class StopAudioFile extends RecordingEvent {}

class DeleteAudioFile extends RecordingEvent {}

class SecDown extends RecordingEvent {}

class SecUp extends RecordingEvent {}

class ChangingNameFile extends RecordingEvent {
  String name;

  ChangingNameFile(this.name);
}

//Audio PLAYER event
class SetAudioUrl extends RecordingEvent {}
