import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:movies_apps/domain/watch_later/repository/watch.later.repository.dart';
import 'package:movies_apps/domain/watch_later/watch.later.model.dart';

class WatchingListController extends GetxController {
  ///repository
  final _watchingListRepository = WatchLaterRepository();
  ///obj
  var watchLater = WatchLaterModel().obs;

  ///loading state
  final isLoading=false.obs;

  @override
  void onInit() {
    _getWatchLater();
    super.onInit();
  }

  ///get local content
  _getWatchLater()async{
    isLoading.value=true;
    watchLater.value = await _watchingListRepository.getWatchLater();
    Future.delayed(const Duration(seconds: 1),()=>isLoading.value=false);
  }

  addToWatchingList(WatchLaterResults result) async{
    isLoading.value=true;
    var data = <WatchLaterResults>[];
    if(watchLater.value.results!=null && watchLater.value.results!.isNotEmpty){
      if(watchLater.value.results!.where((e) => e.id==result.id).isEmpty){
        data=watchLater.value.results!;
        data.add(result);
      }
    }else{
     data.add(result);
    }

    _watchingListRepository.setWatchLater(WatchLaterModel(results: data));

    isLoading.value=false;

    await _getWatchLater();
  }

  ///validate is exist
  bool checkIsExist({int? id}) {
    if(watchLater.value.results!=null && watchLater.value.results!.isNotEmpty){
      if(watchLater.value.results!.where((e) => e.id == id).isNotEmpty){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }
}
