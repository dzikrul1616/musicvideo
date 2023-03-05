import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/video_controller.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late YoutubePlayerController _player;
  @override
  void initState() {
    final video = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=A9IN0cpPCZE');
    _player = YoutubePlayerController(
        initialVideoId: video!,
        flags: const YoutubePlayerFlags(autoPlay: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: YoutubePlayer(
              controller: _player,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Siap'),
              bottomActions: [
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                      playedColor: Colors.pink, handleColor: Colors.pink),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
