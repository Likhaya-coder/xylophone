import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:sound_library/sound_library.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: XylophoneApp(),
  ));
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  // Create a player
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buttonList({Color? color, int? soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(soundNumber!);
        },
        child: const Text(
          'Click Me',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buttonList(color: Colors.red, soundNumber: 1),
          buttonList(color: Colors.blue, soundNumber: 2),
          buttonList(color: Colors.teal, soundNumber: 3),
          buttonList(color: Colors.amber, soundNumber: 4),
          buttonList(color: Colors.deepOrange, soundNumber: 5),
          buttonList(color: Colors.lime, soundNumber: 6),
          buttonList(color: Colors.pink, soundNumber: 7),
        ],
      ),
    );
  }
}
