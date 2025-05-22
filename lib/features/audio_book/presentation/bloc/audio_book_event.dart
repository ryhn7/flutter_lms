part of 'audio_book_bloc.dart';

@freezed
class AudioBookEvent with _$AudioBookEvent {
  const factory AudioBookEvent.getAudioByIdRequested(String? id) =
      _GetAudioByIdRequested;
}