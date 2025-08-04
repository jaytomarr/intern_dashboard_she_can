import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';

void main() {
  // Add error handling for keyboard events
  FlutterError.onError = (FlutterErrorDetails details) {
    // Filter out keyboard-related errors that are known Flutter issues
    if (details.exception.toString().contains('hardware_keyboard.dart') ||
        details.exception.toString().contains('KeyDownEvent') ||
        details.exception.toString().contains('PhysicalKeyboardKey')) {
      // Log the error but don't crash the app
      debugPrint('Keyboard event error (non-critical): ${details.exception}');
      return;
    }

    // Handle other errors normally
    FlutterError.presentError(details);
  };

  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    const ProviderScope(
      child: InternDashboardApp(),
    ),
  );
}
