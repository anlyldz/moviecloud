import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/movie/views/category/coming_soon_view.dart';
import 'package:movies_apps/presentation/home/movie/views/category/now_playing_view.dart';
import 'package:movies_apps/presentation/home/movie/views/category/popular_movie_view.dart';
import 'package:movies_apps/presentation/home/movie/views/category/top_rated_view.dart';

import '../../controllers/movie.controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: RefreshIndicator(
            onRefresh: ()async=>controller.onInit(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 20.0,
                  ),

                  ///coming soon section
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: comtext.title(
                        text: 'Coming Soon', size: 18.0, color: Colors.white),
                  ),
                  const ComingSoonView(),
                  const SizedBox(
                    height: 10.0,
                  ),

                  ///trending
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: comtext.title(
                        text: 'Trending Movies', size: 18.0, color: Colors.white),
                  ),
                  const PopularMovieView(),

                  ///now playing
                  const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: comtext.title(
                          text: 'Now Playing Movies', size: 18.0, color: Colors.white)),
                  const NowPlayingView(),

                  ///toprated
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: comtext.title(
                          text: 'Top Rated Movies', size: 18.0, color: Colors.white)),
                  const TopRatedView(),

                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
