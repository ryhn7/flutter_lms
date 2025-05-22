import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';
import 'package:talent_insider/features/audio_book/domain/repositories/audio_book_repository.dart';

class GetAudioById {
  final AudioBookRepository repository;

  GetAudioById({required this.repository});
  Future<ResultState<Audio>> call(String? id) async {
    return repository.getDetailAudioBook(id);
  }
}
