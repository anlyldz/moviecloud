import 'package:get/get.dart';
import 'package:movies_apps/config.dart';
import 'package:movies_apps/domain/movie/detail.movie.model.dart';
import 'package:movies_apps/domain/movie/movie.model.dart';


class MovieProvider extends GetConnect {
  static const apiKey = '963a04d65af57e8e8269bda27d9c5482';

  ///fetch top rated movie
  Future<Response<MovieModel>> getTopRated() =>
      get<MovieModel>(
        '${ConfigEnvironments
            .getEnvironments()['url']}movie/top_rated?api_key=$apiKey',
        decoder: (obj) => MovieModel.fromJson(obj),
      );

  ///fetch upcoming movie
  Future<Response<MovieModel>> getUpcomingMovie() =>
      get<MovieModel>(
        '${ConfigEnvironments
            .getEnvironments()['url']}movie/upcoming?api_key=$apiKey',
        decoder: (obj) => MovieModel.fromJson(obj),
      );

  ///fetch now playing movie
  Future<Response<MovieModel>> getNowPlaying() =>
      get<MovieModel>(
        '${ConfigEnvironments
            .getEnvironments()['url']}movie/now_playing?api_key=$apiKey',
        decoder: (obj) => MovieModel.fromJson(obj),
      );

  ///fetch popular movie
  Future<Response<MovieModel>> getPopularMovie() =>
      get<MovieModel>(
        '${ConfigEnvironments
            .getEnvironments()['url']}movie/popular?api_key=$apiKey',
        decoder: (obj) => MovieModel.fromJson(obj),
      );

  ///get detail movie by id
  Future<Response<DetailMovieModel>> getDetailMovie(id) =>
      get<DetailMovieModel>(
        '${ConfigEnvironments
            .getEnvironments()['url']}movie/$id?api_key=$apiKey',
        decoder: (obj) => DetailMovieModel.fromJson(obj),
      );
}
