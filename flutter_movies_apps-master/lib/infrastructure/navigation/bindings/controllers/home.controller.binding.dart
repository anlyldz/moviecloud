import 'package:get/get.dart';

import 'package:movies_apps/presentation/home/controllers/movie.controller.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';
import 'package:movies_apps/presentation/home/controllers/watching.list.controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(
      () => MovieController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TvShowController>(
        ()=>TvShowController(),
    );
    Get.lazyPut<WatchingListController>(
          ()=>WatchingListController(),
    );
  }
}
