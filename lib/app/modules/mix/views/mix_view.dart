import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_app/app/modules/Music/views/music_view.dart';
import 'package:music_app/app/modules/Video/views/video_view.dart';


import '../controllers/mix_controller.dart';

class MixView extends GetView<MixController> {
  const MixView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Music",
              ),
              Tab(
                text: "Video",
              ),
            ],
          ),
          title: const Text('Player'),
        ),
        body: TabBarView(
          children: [
            MusicView(),
            VideoView(),
          ],
        ),
      ),
    );
  }
}
