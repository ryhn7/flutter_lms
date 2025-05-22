import 'package:talent_insider/core/network/api_config.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';

class AudioApi{
  ApiConfig apiConfig;
  AudioApi({required this.apiConfig});
  
  Future<Audio> getDetailAudioBook(String? id) async {
    try {
      final response = await apiConfig.getApi<Audio>(
        '/audio/$id?\$lookup=*',
        requiresAuth: false,
        decoder: (json) => Audio.fromJson(json),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to get audio book by id: $e');
    }
  }
}