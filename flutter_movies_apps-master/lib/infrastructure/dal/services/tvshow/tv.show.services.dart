import 'dart:developer';

import 'package:movies_apps/domain/tvshow/detail.tv.model.dart';
import 'package:movies_apps/domain/tvshow/provider/tv.provider.dart';
import 'package:movies_apps/domain/tvshow/tv.show.model.dart';

class TvShowServices {
  final _provider = TvProvider();

  ///fetching toprated
  Future<TvShowModel> fetchTopRatedTv() async {
    try {
      TvShowModel? obj;
      await _provider.getTopRatedTv().then((value) {
        // print('popular url : ${value.request!.url}');
        if (value.statusCode == 200) {
          obj = value.body;
        } else {
          obj = null;
        }
      });
      return Future.value(obj);
    } catch (e) {
      log('error data : $e');
      return throw 'error';
    }
  }

  ///fetching today airing
  Future<TvShowModel> fetchTodayAiringTv() async {
    try {
      TvShowModel? obj;
      await _provider.getTodayAiringTv().then((value) {
        // print('popular url : ${value.request!.url}');
        if (value.statusCode == 200) {
          obj = value.body;
        } else {
          obj = null;
        }
      });
      return Future.value(obj);
    } catch (e) {
      log('error data : $e');
      return throw 'error';
    }
  }
//fetching popular
  Future<TvShowModel> fetchPopularTv() async {
    try {
      TvShowModel? obj;
      await _provider.getPopularTv().then((value) {
        // print('popular url : ${value.request!.url}');
        if (value.statusCode == 200) {
          obj = value.body;
        } else {
          obj = null;
        }
      });
      return Future.value(obj);
    } catch (e) {
      log('error data : $e');
      return throw 'error';
    }
  }

  ///fetching onair
  Future<TvShowModel> fetchOnAirTv() async {
    try {
      TvShowModel? obj;
      await _provider.getOnAirTv().then((value) {
        // print('popular url : ${value.request!.url}');
        if (value.statusCode == 200) {
          obj = value.body;
        } else {
          obj = null;
        }
      });
      return Future.value(obj);
    } catch (e) {
      log('error data : $e');
      return throw 'error';
    }
  }

  ///fetching detail
  Future<DetailTvModel> getDetail(id) async {
    try {
      DetailTvModel? model;
      await _provider.getDetailTv(id).then((results) {
        if (results.statusCode == 200) {
          model = results.body;
        } else {
          model = null;
        }
      });
      return Future.value(model);
    } catch (e) {
      log('error detail : $e');
      return throw 'error';
    }
  }
}
