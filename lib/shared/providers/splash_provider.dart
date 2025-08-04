import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class SplashProvider extends StateNotifier<bool> {
  SplashProvider() : super(true) {
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      state = false;
    });
  }
}

final splashProvider = StateNotifierProvider<SplashProvider, bool>((ref) {
  return SplashProvider();
});
