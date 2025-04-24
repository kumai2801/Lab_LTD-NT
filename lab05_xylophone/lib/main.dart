import 'package:flutter/material.dart';
import 'components/sound_button.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SoundButton(color: Colors.red, soundNumber: 1),
              SoundButton(color: Colors.orange, soundNumber: 2),
              SoundButton(color: Colors.yellow, soundNumber: 3),
              SoundButton(color: Colors.green, soundNumber: 4),
              SoundButton(color: Colors.teal, soundNumber: 5),
              SoundButton(color: Colors.blue, soundNumber: 6),
              SoundButton(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
