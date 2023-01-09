import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/movie.controller.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';
import 'package:movies_apps/presentation/home/controllers/watching.list.controller.dart';

class WatchingListView extends StatelessWidget {
  WatchingListView({Key? key}) : super(key: key);
  final controller = Get.put(WatchingListController());
  final _movieController = Get.put(MovieController());
  final _tvShowController = Get.put(TvShowController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: RefreshIndicator(
            onRefresh: () async => controller.onInit(),
            child:Obx(()=>controller.isLoading.value?largeItemHorizontalShimmer(isVertical:true): SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  ///coming soon section



                  if ((controller.watchLater.value == null ||
                      controller.watchLater.value.results == null) ||
                      controller.watchLater.value.results!.isEmpty) ...[
                    SizedBox(
                      height: Get.height/3,
                    ),
                    Center(
                      child: comtext.title(
                          text: 'Whoops !! your watching list is Empty',
                          size: 16.0,
                          color: Colors.white),
                    )
                  ] else ...[
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: comtext.title(
                          text: 'Your Watching List',
                          size: 18.0,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.watchLater.value.results!.length,
                      itemBuilder: (context, index) => _items(index),
                    ),
                  ],

                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget _items(index) {
    final item = controller.watchLater.value.results![index];
    return GestureDetector(
      onTap: () async {
        if(item.isMovie==true){
          _movieController.setMovieId(item.id);
          _movieController.getDetailMovie();
          await Get.toNamed('/detail-movie');

        }else{
          _tvShowController.seTvId(item.id);
          _tvShowController.getDetailTv();
          await Get.toNamed('/detail-tv');
        }

      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Get.width,
        height: Get.height / 4,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${item.posterPath}',
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
                      text: item.title,
                      color: Colors.white.withOpacity(0.7),
                      size: 16.0),
                  const SizedBox(
                    height: 10.0,
                  ),
                  comtext.regularElipsis(
                    text: item.overview,
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
