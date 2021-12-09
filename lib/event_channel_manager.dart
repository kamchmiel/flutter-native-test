import 'package:flutter/services.dart';

class EventChannelManager {
  static const _eventChannel = EventChannel('EVENT_CHANNEL_TEST');

  Stream<int> get getRandomNumberStream {
    return _eventChannel.receiveBroadcastStream().cast();
  }
}
