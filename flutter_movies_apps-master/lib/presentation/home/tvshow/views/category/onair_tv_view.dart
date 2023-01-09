import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';

class OnAirTvView extends GetView<TvShowController> {
  const OnAirTvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isOnAirLoading.value
        ? SizedBox(
      height: Get.height / 3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _items(index),
        itemCount: controller.onAirTv.value.results!.length,
      ),
    )
        : largeItemHorizontalShimmer());
  }

  Widget _items(index) {
    final item = controller.onAirTv.value.results![index];
    return GestureDetector(
      onTap: ()async{
        controller.seTvId(item.id);
        controller.getDetailTv();
        await Get.toNamed('/detail-tv');

      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Get.width,
        height: Get.height / 4,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
            fit: BoxFit.cover,
            image:  NetworkImage(
              'https://image.tmdb.org/t/p/w500${item.backdropPath}',
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Wrap(
                children: [
                  comtext.title(
                      text: item.name,
                      color: Colors.white.withOpacity(0.7),
                      size: 16.0),
                  const SizedBox(
                    height: 10.0,
                  ),
                  comtext.regularElipsis(
                    text:item.overview,
                    color: Colors.white.withOpacity(0.8),
                    maxLine: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}