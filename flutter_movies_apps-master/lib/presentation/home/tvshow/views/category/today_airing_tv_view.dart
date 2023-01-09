import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';

class TodayAiringTvView extends GetView<TvShowController> {
  const TodayAiringTvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isTodayAiringLoading.value
        ? SizedBox(
      height: Get.height / 2.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => _items(index),
        itemCount: controller.todayAiringTv.value.results!.length,
        scrollDirection: Axis.horizontal,
      ),
    )
        : itemHorizontalShimmer());
  }

  Widget _items(index) {
    final item = controller.todayAiringTv.value.results![index];

    return GestureDetector(
      onTap: ()async{
        controller.seTvId(item.id);
        controller.getDetailTv();
        await Get.toNamed('/detail-tv');
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
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${item.backdropPath}',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: comtext.title(
                  text: item.name, color: Colors.white, size: 14.0),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: comtext.regularElipsis(
                  text: item.overview,
                  color: Colors.white,
                  maxLine: 3,
                  size: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}