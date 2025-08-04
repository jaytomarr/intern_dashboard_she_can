import 'package:flutter/material.dart';
import '../navigation/bottom_nav_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
} 