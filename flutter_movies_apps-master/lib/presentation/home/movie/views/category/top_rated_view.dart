import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/movie.controller.dart';

class TopRatedView extends GetView<MovieController> {
  const TopRatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isNowPlayLoading.value
        ? SizedBox(
      height: Get.height / 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => _items(index),
        itemCount: controller.topRatedMovies.value.results!.length,
        scrollDirection: Axis.horizontal,
      ),
    ):itemHorizontalShimmer());
  }

  Widget _items(index) {
    final item = controller.topRatedMovies.value.results![index];
    return  GestureDetector(
      onTap: ()async{
        controller.setMovieId(item.id);
        controller.getDetailMovie();
        await Get.toNamed('/detail-movie');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Get.width / 1.5,
        margin: const EdgeInsets.only(left: 10.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width / 1.5,
              height: Get.height / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:  NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${item.backdropPath}',
                  ),),),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 10.0),
              child: comtext.title(
                  text: item.title,
                  color: Colors.white,
                  size: 14.0),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: comtext.regular(
                      text: '${item.voteAverage}',
                      color: Colors.white,
                      size: 12.0),
                ),
                const Icon(
                  Icons.star_outlined,
                  color: Colors.yellow,
                  size: 10.0,
                )
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 10.0),
              child: comtext.regularElipsis(
                  text:item.overview,
                  color: Colors.white,
                  maxLine: 2,
                  size: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
