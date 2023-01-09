
import 'package:movies_apps/domain/tvshow/detail.tv.model.dart';
import 'package:movies_apps/domain/tvshow/tv.show.model.dart';
import 'package:movies_apps/infrastructure/dal/services/tvshow/tv.show.services.dart';

class TvShowRepository{
  final _service = TvShowServices();
  Future<TvShowModel>? getTopRatedTv() => _service.fetchTopRatedTv();
  Future<TvShowModel>? getTodayAiringTv()=>_service.fetchTodayAiringTv();
  Future<TvShowModel>? getPopularTv()=>_service.fetchPopularTv();
  Future<TvShowModel>? getOnAirTv()=>_service.fetchOnAirTv();
  Future<DetailTvModel> getDetailTv(id)=>_service.getDetail(id);

}