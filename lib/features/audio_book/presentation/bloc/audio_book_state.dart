part of 'audio_book_bloc.dart';

@freezed
class AudioBookState with _$AudioBookState {
  const factory AudioBookState.initial() = _Initial;
  const factory AudioBookState.loading() = _Loading;
  const factory AudioBookState.audioLoaded(Audio audio) = _AudioLoaded;
  const factory AudioBookState.error(String message) = _Error;
}
