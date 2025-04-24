import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('notes/note$noteNumber.mp3'));
  }

  Widget buildKey({
    required int noteNumber,
    required Color color,
    required String noteLabel,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ElevatedButton(
          onPressed: () => playSound(noteNumber),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            padding: const EdgeInsets.all(0),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              noteLabel,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text(
          'Xylophone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(noteNumber: 1, color: Colors.red, noteLabel: 'C'),
                buildKey(noteNumber: 2, color: Colors.orange, noteLabel: 'D'),
                buildKey(noteNumber: 3, color: Colors.yellow, noteLabel: 'E'),
                buildKey(noteNumber: 4, color: Colors.green, noteLabel: 'F'),
                buildKey(noteNumber: 5, color: Colors.teal, noteLabel: 'G'),
                buildKey(noteNumber: 6, color: Colors.blue, noteLabel: 'A'),
                buildKey(noteNumber: 7, color: Colors.purple, noteLabel: 'B'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}