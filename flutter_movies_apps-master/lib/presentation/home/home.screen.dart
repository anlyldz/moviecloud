import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movies_apps/config.dart';
import 'package:movies_apps/presentation/home/movie/views/movie_view.dart';
import 'package:movies_apps/presentation/home/tvshow/views/tv_show_view.dart';
import 'package:movies_apps/presentation/home/watching_list/watching_list_view.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  static final iconList = <IconData>[
    Icons.dashboard,
    Icons.explore,
    Icons.watch_later_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Image.asset(
          AssetsEnv.APPSLOGO,
          height: Get.height / 8,
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: (index) => controller.setMenuIndex(index),
        items: const [
          TabItem(
            icon: Icons.movie,
            title: 'Movies',
          ),
          TabItem(icon: Icons.tv_rounded, title: 'TV show'),
          TabItem(icon: Icons.watch_later_outlined, title: 'Watch list')
        ],
      ),
      body: Obx(() => controller.menuIndex.value == 0
          ? const MovieView()
          : controller.menuIndex.value == 1
              ? const TvShowView()
              : WatchingListView()),
    );
  }
}
