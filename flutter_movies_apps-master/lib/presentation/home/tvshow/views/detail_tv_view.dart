import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movies_apps/domain/watch_later/watch.later.model.dart';
import 'package:movies_apps/presentation/component/shimmer.component.dart';
import 'package:movies_apps/presentation/component/text.component.dart';
import 'package:movies_apps/presentation/home/controllers/tvshow.controller.dart';
import 'package:movies_apps/presentation/home/controllers/watching.list.controller.dart';

class DetailTvView extends StatelessWidget {
  DetailTvView({Key? key}) : super(key: key);
  final controller = Get.put(TvShowController());
  final watchingListController = Get.put(WatchingListController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: const Color(0xFF212121),
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Obx(() => !controller.isDetailLoading.value
                  ? RefreshIndicator(
                      child: CustomScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            backgroundColor: const Color(0xFF212121),
                            elevation: 0.0,
                            expandedHeight: Get.height / 2,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Image.network(
                                'https://image.tmdb.org/t/p/w500/${controller.detailTv.value.posterPath}',
                                colorBlendMode: BlendMode.darken,
                                color: Colors.black.withOpacity(0.5),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  ///imdb section
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6.0, horizontal: 16.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.red,
                                        ),
                                        child: comtext.title(
                                            text:
                                                'IMDB ${controller.detailTv.value.voteAverage!.ceilToDouble()}',
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      const Icon(
                                        Icons.star_outlined,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      comtext.title(
                                          text: controller
                                              .detailTv.value.voteAverage
                                              .toString()
                                              .substring(0, 3),
                                          color: Colors.red),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      comtext.regular(
                                          text:
                                              '(${NumberFormat.compact().format(controller.detailTv.value.voteCount)}) reviews',
                                          size: 14.0,
                                          color: Colors.white)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  ///title section
                                  comtext.title(
                                      text: controller.detailTv.value.name,
                                      color: Colors.white,
                                      size: 24.0),
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  ///tagline section
                                  comtext.regular(
                                      text: controller.detailTv.value.tagline,
                                      color: Colors.white,
                                      size: 16.0),

                                  ///genre section
                                  const SizedBox(
                                    height: 10.0,
                                  ),

                                  ///genre section
                                  controller.detailTv.value.genres != null &&
                                          controller
                                              .detailTv.value.genres!.isNotEmpty
                                      ? Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          children: controller
                                              .detailTv.value.genres!
                                              .map(
                                                (e) => Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 6.0,
                                                      horizontal: 16.0),
                                                  margin: const EdgeInsets.only(
                                                      right: 10.0, top: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    color: Colors.black,
                                                  ),
                                                  child: comtext.title(
                                                      text: e.name,
                                                      color: Colors.white,
                                                      size: 12.0),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : const SizedBox(
                                          height: 0.0,
                                        ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  ///overview
                                  comtext.title(
                                      text: 'Synopsis',
                                      size: 24.0,
                                      color: Colors.white),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  comtext.regular(
                                      text: controller.detailTv.value.overview,
                                      color: Colors.white,
                                      size: 16.0),
                                  const SizedBox(
                                    height: 20.0,
                                  ),

                                  comtext.title(
                                      text: 'First Air Date',
                                      size: 24.0,
                                      color: Colors.white),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  comtext.regular(
                                      text: DateFormat('MMMM, dd yyyy')
                                          .format(DateTime.parse(controller
                                              .detailTv.value.firstAirDate!))
                                          .toString(),
                                      color: Colors.white,
                                      size: 16.0),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  ElevatedButton(
                                      onPressed: watchingListController.checkIsExist(
                                              id: controller.detailTv.value.id)
                                          ? null
                                          : () async {
                                              WatchLaterResults result =
                                                  WatchLaterResults(
                                                id: controller
                                                    .detailTv.value.id,
                                                title: controller
                                                    .detailTv.value.name,
                                                overview: controller
                                                    .detailTv.value.overview,
                                                rating: controller
                                                    .detailTv.value.voteAverage,
                                                posterPath: controller
                                                    .detailTv.value.posterPath,
                                                isMovie: false,
                                              );
                                              await watchingListController
                                                  .addToWatchingList(result);
                                            },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: watchingListController
                                                  .checkIsExist(
                                                      id: controller
                                                          .detailTv.value.id)
                                              ? Colors.black
                                              : Colors.red,
                                          minimumSize: Size(Get.width, 50.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0))),
                                      child: comtext.title(
                                          text: watchingListController.checkIsExist(
                                                  id: controller.detailTv.value.id)
                                              ? 'You\'re already added'
                                              : 'add to watching list',
                                          color: watchingListController.checkIsExist(id: controller.detailTv.value.id) ? Colors.grey : Colors.white,
                                          size: 16.0)),
                                  SizedBox(
                                    height: Get.height / 6,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      onRefresh: () async => controller.getDetailTv())
                  : detailMovieShimmer()),
            )),
        onWillPop: () async {
          print('popped');
          controller.tvId.value = 0;
          return true;
        });
  }
}
