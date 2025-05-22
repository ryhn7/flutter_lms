import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';
import 'package:talent_insider/features/audio_book/domain/usecases/usecase_audio_book.dart';

part 'audio_book_bloc.freezed.dart';
part 'audio_book_event.dart';
part 'audio_book_state.dart';

class AudioBookBloc extends Bloc<AudioBookEvent, AudioBookState> {
  final UsecaseAudioBook _usecases;

  // Cache for audio data
  final Map<String, Audio> _audioCache = {};

  AudioBookBloc({
    required UsecaseAudioBook usecases,
  })  : _usecases = usecases,
        super(const AudioBookState.initial()) {
    on<AudioBookEvent>((event, emit) async {
      await event.when(getAudioByIdRequested: (id) => _onGetAudioByIdRequested(id, emit));
    });
  }

  Future<void> _onGetAudioByIdRequested(
    String? id,
    Emitter<AudioBookState> emit,
  ) async {
    // Validation - handle null or empty ID
    if (id == null || id.isEmpty) {
      emit(const AudioBookState.error('Invalid audio book ID'));
      return;
    }

    // Check if audio is in cache
    final cachedAudio = _audioCache[id];

    // If we have cached audio, emit it immediately
    if (cachedAudio != null) {
      emit(AudioBookState.audioLoaded(cachedAudio));
    } else {
      emit(const AudioBookState.loading());
    }

    try {
      final result = await _usecases.getAudioById(id);

      // Handle the result based on Success or Error state
      if (result is Success<Audio>) {
        // Update the cache with the new data
        _audioCache[id] = result.data;
        emit(AudioBookState.audioLoaded(result.data));
      } else if (result is Error<Audio>) {
        emit(AudioBookState.error(result.message));
      } else {
        emit(const AudioBookState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(AudioBookState.error('An exception occurred: ${e.toString()}'));
    }
  }
}
