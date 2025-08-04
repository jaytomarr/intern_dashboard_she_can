import 'package:flutter/material.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class InternDashboardApp extends StatelessWidget {
  const InternDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'She Can',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
