import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';
import 'package:talent_insider/features/audio_book/data/remote/audio_api.dart';
import 'package:talent_insider/features/audio_book/domain/repositories/audio_book_repository.dart';

class AudioBookRepositoryImpl implements AudioBookRepository {
  final AudioApi _audioApi;
  AudioBookRepositoryImpl({
    required AudioApi audioApi,
  }) : _audioApi = audioApi;

  @override
  Future<ResultState<Audio>> getDetailAudioBook(String? id) async {
    try {
      final audio = await _audioApi.getDetailAudioBook(id);
      return ResultState.success(audio);
    } catch (e) {
      return ResultState.error('Failed to get audio book: $e');
    }
  }
}