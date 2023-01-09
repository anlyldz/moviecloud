import 'package:get/get.dart';
import 'package:movies_apps/config.dart';
import 'package:movies_apps/domain/tvshow/detail.tv.model.dart';

import 'package:movies_apps/domain/tvshow/tv.show.model.dart';

class TvProvider extends GetConnect {
  static const apiKey = '963a04d65af57e8e8269bda27d9c5482';

  ///get popular tv
  Future<Response<TvShowModel>> getPopularTv() => get<TvShowModel>(
        '${ConfigEnvironments.getEnvironments()['url']}tv/popular?api_key=$apiKey',
        decoder: (obj) => TvShowModel.fromJson(obj),
      );

  ///get top rated tv
  Future<Response<TvShowModel>> getTopRatedTv() => get<TvShowModel>(
        '${ConfigEnvironments.getEnvironments()['url']}tv/top_rated?api_key=$apiKey',
        decoder: (obj) => TvShowModel.fromJson(obj),
      );

  /// get onair tv
  Future<Response<TvShowModel>> getOnAirTv() => get<TvShowModel>(
        '${ConfigEnvironments.getEnvironments()['url']}tv/on_the_air?api_key=$apiKey',
        decoder: (obj) => TvShowModel.fromJson(obj),
      );

  ///today airing tv
  Future<Response<TvShowModel>> getTodayAiringTv() =>
      get<TvShowModel>(
        '${ConfigEnvironments.getEnvironments()['url']}tv/airing_today?api_key=$apiKey',
        decoder: (obj) => TvShowModel.fromJson(obj),
      );

  ///get detail tv by id
  Future<Response<DetailTvModel>> getDetailTv(id) => get<DetailTvModel>(
        '${ConfigEnvironments.getEnvironments()['url']}tv/$id?api_key=$apiKey',
        decoder: (obj) => DetailTvModel.fromJson(obj),
      );
}
