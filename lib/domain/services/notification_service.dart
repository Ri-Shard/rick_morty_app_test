import 'package:flutter/services.dart';

class NotificationService {
  static const platform = MethodChannel('com.example.test_rickandmorty_map');

  Future<void> showNotification(String title, String message) async {
    try {
      await platform.invokeMethod(
          'showNotification', {'title': title, 'message': message});
    } on PlatformException catch (e) {
      print("Failed to show notification: '${e.message}'.");
    }
  }
}
