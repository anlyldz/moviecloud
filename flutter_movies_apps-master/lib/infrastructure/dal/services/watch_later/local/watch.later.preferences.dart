
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WatchLaterPreferences{
  static const String content ='CONTENT';
  final _storage = const FlutterSecureStorage();

  ///set content
  void setContent(dynamic data)async{
    await _storage.write(key: content, value: jsonEncode(data));
  }
  ///get content
  dynamic getContent()async{
    final data = await _storage.read(key: content);
    return data;
  }
  ///delete all local data
  void deleteAll()async=>_storage.deleteAll();
}