import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';

class TopRatedTvView extends GetView<TvShowController> {
  const TopRatedTvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isTopRatedLoading.value
        ? SizedBox(
      height: Get.height / 3.1,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => _items(index),
        itemCount: controller.topRatedTv.value.results!.length,
        scrollDirection: Axis.horizontal,
      ),
    ):itemHorizontalShimmer());
  }

  Widget _items(index) {
    final item = controller.topRatedTv.value.results![index];
    return  GestureDetector(
      onTap: ()async{
        controller.seTvId(item.id);
        controller.getDetailTv();
        await Get.toNamed('/detail-tv');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Get.width / 1.5,
        margin: const EdgeInsets.only(left: 16.0, top: 20.0),
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
                  text: item.name,
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