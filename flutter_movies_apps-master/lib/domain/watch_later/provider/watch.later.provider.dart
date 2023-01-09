
import 'dart:developer';

import 'package:movies_apps/domain/watch_later/watch.later.model.dart';
import 'package:movies_apps/infrastructure/dal/services/watch_later/local/watch.later.preferences.dart';

class WatchLaterPovider{
  final _storage = WatchLaterPreferences();

  ///get local content
  Future<dynamic> getWatchLater()async{
    try{
      final content = await _storage.getContent();
      log('content $content');
      return Future.value(content);
    }catch(e){
      return throw 'error provider $e';
    }
  }

  void setWatchLater(dynamic jsonData)async{
    try{
       _storage.setContent(jsonData);
    }catch(e) {
      log('error set watch later : $e');
    }
  }
}