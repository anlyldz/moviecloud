
import 'package:movies_apps/domain/watch_later/watch.later.model.dart';
import 'package:movies_apps/infrastructure/dal/services/watch_later/watch.later.service.dart';

class WatchLaterRepository{
  final _service = WatchLaterService();
  ///set watch later model
  void setWatchLater(WatchLaterModel model)=>_service.setWatchLater(model);
  ///get watch later content
  Future<WatchLaterModel>getWatchLater()=>_service.getWatchLater();
}