
import 'dart:developer';

import 'package:movies_apps/domain/movie/detail.movie.model.dart';
import 'package:movies_apps/domain/movie/movie.model.dart';
import 'package:movies_apps/domain/movie/providers/movie.provider.dart';

class MovieServices {
  final _provider = MovieProvider();
  Future<MovieModel> fetchNowPlaying()async {
    try{
      MovieModel? obj;
      await _provider.getNowPlaying().then((value){
        //print('nowplay url : ${value.request!.url}');

        if(value.statusCode==200){
          obj=value.body;
        }else{
          obj=null;
        }
      });
      return Future.value(obj);
    }catch(e){
      log('error : $e');
      return throw 'error';
    }
  }
  Future<MovieModel> fetchPopularMovie()async {
    try{
      MovieModel? obj;
      await _provider.getPopularMovie().then((value){
        //print('popular url : ${value.request!.url}');
        if(value.statusCode==200){
          obj=value.body;
        }else{
          obj=null;
        }
      });
      return Future.value(obj);
    }catch(e){
      log('error data : $e');
      return throw 'error';
    }
  }
  Future<MovieModel> fetchTopRatedMovie()async {
    try{
      MovieModel? obj;
      await _provider.getTopRated().then((value){
        // print(value.request!.url);
        if(value.statusCode==200){
          obj=value.body;
        }else{
          obj=null;
        }
      });
      return Future.value(obj);
    }catch(e){
      return throw 'error';
    }
  }
  Future<MovieModel> fetchUpcomingMovie()async {
    try{
      MovieModel? obj;
      await _provider.getUpcomingMovie().then((value){
        //  print('upcoming url : ${value.request!.url}');

        if(value.statusCode==200){
          obj=value.body;
        }else{
          obj=null;
        }
      });
      return Future.value(obj);
    }catch(e){
      return throw 'error';
    }
  }
  Future<DetailMovieModel> getDetail(id)async{
    try{
      DetailMovieModel? model;
      await _provider.getDetailMovie(id).then((results){
        if(results.statusCode==200){
          model=results.body;
        }else{
          model=null;
        }
      });
      return Future.value(model);
    }catch(e){
      log('error detail : $e');
      return throw 'error';
    }
  }
}