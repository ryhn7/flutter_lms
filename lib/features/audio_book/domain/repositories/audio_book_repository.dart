import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';

abstract interface class AudioBookRepository {
    Future<ResultState<Audio>> getDetailAudioBook(String? id);
}