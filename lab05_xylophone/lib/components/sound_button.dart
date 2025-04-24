import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundButton extends StatelessWidget {
  final Color color;
  final int soundNumber;

  const SoundButton({required this.color, required this.soundNumber});

  void playSound(int number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Container(),
      ),
    );
  }
}
