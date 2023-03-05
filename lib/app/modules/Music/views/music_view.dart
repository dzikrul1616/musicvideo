import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import '../controllers/music_controller.dart';

class MusicView extends StatefulWidget {
  const MusicView({Key? key}) : super(key: key);

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final playeraudio = AudioPlayer();
  bool mulaiMusic = false;
  Duration duration = Duration.zero;
  Duration posisi = Duration.zero;
  @override
  void initState() {
    playeraudio.onPlayerStateChanged.listen((event) {
      setState(() {
        mulaiMusic = event == PlayerState.playing;
      });
    });

    playeraudio.onDurationChanged.listen((durationNew) {
      setState(() {
        duration = durationNew;
      });
    });
    playeraudio.onPositionChanged.listen((positionNew) {
      setState(() {
        posisi = positionNew;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    playeraudio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/song.jpg'), fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/song.jpg',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Laguku',
                style: const TextStyle(
                    color: Colors.white, fontSize: 36, letterSpacing: 6),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Slider(
                        min: 0,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.grey[200],
                        value: posisi.inSeconds.toDouble(),
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) async {}),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(waktu!(posisi).toString()),
                    Text(waktu(duration - posisi).toString())
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pink,
                child: IconButton(
                    onPressed: () async {
                      if (mulaiMusic) {
                        await playeraudio.pause();
                      } else {
                        String url =
                            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
                        await playeraudio.play(UrlSource(url));
                      }
                    },
                    icon: Icon(
                      mulaiMusic ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  String? waktu(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inMinutes.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      second,
    ].join(':');
  }
}
