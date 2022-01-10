import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: PianoPage(),
    );
  }
}

class PianoPage extends StatefulWidget {
  const PianoPage({Key? key}) : super(key: key);

  @override
  State<PianoPage> createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.teal,
    Colors.brown,
    Colors.yellow,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: List.generate(colors.length, (index) {
            return Expanded(
              child: InkWell(
                onTap: () async {
                  await player.setAsset('assets/note$index.wav');
                  player.play();
                  debugPrint(index.toString());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  color: colors[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
