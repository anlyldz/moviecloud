import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/movie.controller.dart';

class PopularMovieView extends GetView<MovieController> {
  const PopularMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isPopularLoading.value
        ? SizedBox(
            height: Get.height / 3,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _items(index),
                itemCount: controller.popularMovies.value.results!.length,
            ),
          )
        : verticalItemShimmer());
  }

  Widget _items(index) {
    final item = controller.popularMovies.value.results![index];
    return GestureDetector(
      onTap: ()async{
        controller.setMovieId(item.id);
        controller.getDetailMovie();
        await Get.toNamed('/detail-movie');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Get.width / 2.5,
        height: Get.height / 4,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        margin: const EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${item.posterPath}',
            ),),),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: Colors.red,
                child: comtext.title(text: '${index+1}', color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
