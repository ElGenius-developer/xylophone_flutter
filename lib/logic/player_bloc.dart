import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerInitial());

  final player =
      new AudioCache(prefix: 'assets/audio/', fixedPlayer: AudioPlayer());

  void changeTone(int number) {
    if (player.fixedPlayer.state == AudioPlayerState.PLAYING) {
      player.fixedPlayer.stop().then((value) => print(value));

      player.clearCache();
    }
    player.play(
      'note$number.wav',
      volume: 10
    );
  }
}
