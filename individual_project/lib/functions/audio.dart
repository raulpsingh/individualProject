import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static AudioPlayer player = AudioPlayer();
  static AudioCache cache = new AudioCache();

  static openingActions() async {
    player = await cache.loop('ALongCold.mp3');
  }

  static stopAudio() {
    player.stop();
  }
}
