import 'dart:io';

import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

Future<Response> fongbeReader(String prefix, int number) async {
  Dio dio = Dio();
  print("'https://agossadourin.pythonanywhere.com/$prefix/$number',");
  try {
    final response = await dio.get(
      'https://agossadourin.pythonanywhere.com/$prefix/$number',
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    return response;
  } catch (e) {
    print('Request error: $e');
    throw e;
  }
}

void playFongbe(String prefix, int number) async {
  try {
    final response = await fongbeReader(
      prefix,
      number,
    );
    final bytes = response.data;

    // Get the temporary directory
    final directory = await getTemporaryDirectory();
    // Create a temporary file with a .wav extension
    final file = File('${directory.path}/audio.wav');
    // Write the bytes to the file
    await file.writeAsBytes(bytes);

    AudioPlayer player = AudioPlayer();
    AudioSource audioSource = AudioSource.uri(Uri.parse(file.path));
    await player.setAudioSource(audioSource);
    await player.play();
  } catch (e) {
    print('Audio error: $e');
  }
}
