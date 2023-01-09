
import 'dart:developer';

import 'package:get/get.dart';
import 'package:movies_apps/domain/tvshow/detail.tv.model.dart';
import 'package:movies_apps/domain/tvshow/repository/tv.show.repository.dart';
import 'package:movies_apps/domain/tvshow/tv.show.model.dart';


class TvShowController extends GetxController{
  ///config
  final tvId = 0.obs;
  ///tv object
  var topRatedTv = TvShowModel().obs;
  var popularTv = TvShowModel().obs;
  var onAirTv = TvShowModel().obs;
  var todayAiringTv = TvShowModel().obs;
  var detailTv = DetailTvModel().obs;

  ///all repository
  final _tvShowRespository= TvShowRepository();

  ///all state loading
  final isTopRatedLoading=false.obs;
  final isOnAirLoading=false.obs;
  final isTodayAiringLoading=false.obs;
  final isPopularLoading=false.obs;
  final isDetailLoading = false.obs;

  @override
  void onInit() {
    _fetchPopularTv();
    _fetchOnAirTv();
    _fetchTodayAiring();
    _fetchTopRatedTv();
    super.onInit();
  }

  /// fetch top rated tv
  void _fetchTopRatedTv()async{
    isTopRatedLoading.value=true;
    topRatedTv.value = await _tvShowRespository.getTopRatedTv()!;
    Future.delayed(const Duration(seconds: 2),()=>isTopRatedLoading.value=false);
  }

  /// fetch Popular Tv
  void _fetchPopularTv()async{
    isPopularLoading.value=true;
    popularTv.value=await _tvShowRespository.getPopularTv()!;
    Future.delayed(const Duration(seconds: 2),()=>isPopularLoading.value=false);
  }

  /// fetch on air
  void _fetchOnAirTv()async{
    isOnAirLoading.value=true;
    onAirTv.value = await _tvShowRespository.getOnAirTv()!;
    Future.delayed(const Duration(seconds: 1),()=>isOnAirLoading.value=false);
  }

  ///fetch today airing
  void _fetchTodayAiring()async{
    isTodayAiringLoading.value=true;
    todayAiringTv.value = await _tvShowRespository.getTodayAiringTv()!;
    Future.delayed(const Duration(seconds: 2),()=>isTodayAiringLoading.value=false);
  }

  /// get detail tvby ID
  void seTvId(id)=>tvId.value=id;
  void getDetailTv()async{
    isDetailLoading.value=true;
    detailTv.value = await _tvShowRespository.getDetailTv(tvId.value);
    log('detail title movie : ${detailTv.value.name}');
    Future.delayed(const Duration(seconds: 1),()=>isDetailLoading.value=false);
    update();
  }
}