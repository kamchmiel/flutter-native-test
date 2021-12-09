import 'dart:convert';

import 'package:flutter/services.dart';

import 'model/cat.dart';
import 'model/dog.dart';

class MethodChannelManager {
  static const _methodChannel = MethodChannel('METHOD_CHANNEL_TEST');

  void showAlert(String message) {
    _methodChannel.invokeMethod('showNativeAlert', message);
  }

  Future<Cat?> transformDogIntoCat(Dog dog) async {
    final result = await _methodChannel.invokeMethod('transformDogIntoCat', dog.toJson());
    try {
      return Cat.fromJson(jsonDecode(result));
    } catch (e) {
      print('Error while parsing result from native side: $e');
    }
  }
}
