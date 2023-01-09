
import 'dart:developer';

import 'package:movies_apps/domain/movie/detail.movie.model.dart';
import 'package:movies_apps/domain/movie/providers/movie.provider.dart';
class DetailMovieService{
  final _provider = MovieProvider();
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