import 'package:get/get.dart';

import '../modules/Music/bindings/music_binding.dart';
import '../modules/Music/views/music_view.dart';
import '../modules/Video/bindings/video_binding.dart';
import '../modules/Video/views/video_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mix/bindings/mix_binding.dart';
import '../modules/mix/views/mix_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MIX,
      page: () => const MixView(),
      binding: MixBinding(),
    ),
    GetPage(
      name: _Paths.MUSIC,
      page: () => const MusicView(),
      binding: MusicBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
  ];
}
