
import 'package:movies_apps/domain/movie/detail.movie.model.dart';
import 'package:movies_apps/domain/movie/movie.model.dart';
import 'package:movies_apps/infrastructure/dal/services/movies/movie.services.dart';

class MovieRepository{
  final _service = MovieServices();
  ///get now playing
  Future<MovieModel>? getNowPlaying()=>_service.fetchNowPlaying();
  /// popular movie
  Future<MovieModel>? getPopularMovie()=>_service.fetchPopularMovie();
  ///get top rated
  Future<MovieModel>? getTopRated()=>_service.fetchTopRatedMovie();
  ///get ucpcoming
  Future<MovieModel>? getUpcomingMovie()=>_service.fetchUpcomingMovie();
  /// get detail movie
  Future<DetailMovieModel> getDetailMovie(id)=>_service.getDetail(id);
}