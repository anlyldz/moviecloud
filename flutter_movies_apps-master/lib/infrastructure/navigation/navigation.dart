import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movies_apps/presentation/home/movie/views/detail_movie_view.dart';
import 'package:movies_apps/presentation/home/tvshow/views/detail_tv_view.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({required this.child});

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
        name: Routes.DETAILMOVIE,
        page: () =>   DetailMovieView(),
        binding: HomeControllerBinding()),
    GetPage(
        name: Routes.DETAILTV,
        page: () =>   DetailTvView(),
        binding: HomeControllerBinding())
  ];
}
