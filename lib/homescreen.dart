import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class XyloPhone extends StatefulWidget {
  const XyloPhone({super.key});

  @override
  State<XyloPhone> createState() => _XyloPhoneState();
}

class _XyloPhoneState extends State<XyloPhone> {
  void playSound(int soundNumber) async {
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource('assets_note$soundNumber.wav'));
  }

  Expanded buildKey(Color colors, int soundNumber){
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:colors, shape: LinearBorder()),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text("")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(Colors.red,1),
            buildKey(Colors.blue,2),
            buildKey(Colors.yellow,3),
            buildKey(Colors.green,4),
            buildKey(Colors.pinkAccent,5),
            buildKey(Colors.orange,6),
            buildKey(Colors.deepPurple,7),
          ],
        ),
      ),
    );
  }
}
