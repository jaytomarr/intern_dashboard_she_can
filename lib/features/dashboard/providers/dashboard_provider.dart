import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/mock_data.dart';

// Dashboard State
class DashboardState {
  final bool isLoading;
  final String? error;
  final double totalDonations;
  final double monthlyTarget;
  final int referralsCount;
  final List<dynamic> achievements;
  final double monthlyProgress;

  const DashboardState({
    this.isLoading = false,
    this.error,
    this.totalDonations = 0.0,
    this.monthlyTarget = 10000.0,
    this.referralsCount = 0,
    this.achievements = const [],
    this.monthlyProgress = 0.0,
  });

  DashboardState copyWith({
    bool? isLoading,
    String? error,
    double? totalDonations,
    double? monthlyTarget,
    int? referralsCount,
    List<dynamic>? achievements,
    double? monthlyProgress,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      totalDonations: totalDonations ?? this.totalDonations,
      monthlyTarget: monthlyTarget ?? this.monthlyTarget,
      referralsCount: referralsCount ?? this.referralsCount,
      achievements: achievements ?? this.achievements,
      monthlyProgress: monthlyProgress ?? this.monthlyProgress,
    );
  }
}

// Dashboard Notifier
class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(const DashboardState());

  Future<void> loadDashboardData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      final data = MockData.dashboardData;

      // Debug print to check the data
      debugPrint('DashboardProvider - Loading data: $data');
      debugPrint('DashboardProvider - Rewards data: ${data['rewards']}');
      debugPrint(
          'DashboardProvider - Rewards type: ${data['rewards'].runtimeType}');

      final achievements = List<dynamic>.from(data['rewards']);
      debugPrint(
          'DashboardProvider - Achievements after conversion: $achievements');
      debugPrint(
          'DashboardProvider - Achievements length: ${achievements.length}');

      state = state.copyWith(
        isLoading: false,
        totalDonations: data['totalDonations'],
        monthlyTarget: data['monthlyTarget'],
        referralsCount: data['referralsCount'],
        achievements: achievements,
        monthlyProgress: data['monthlyProgress'],
        error: null,
      );

      debugPrint(
          'DashboardProvider - Final state achievements: ${state.achievements}');
      debugPrint(
          'DashboardProvider - Final state achievements length: ${state.achievements.length}');
    } catch (e) {
      debugPrint('DashboardProvider - Error loading data: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void refreshData() {
    loadDashboardData();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Providers
final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  return DashboardNotifier();
});

final dashboardDataProvider = FutureProvider<void>((ref) async {
  final notifier = ref.read(dashboardProvider.notifier);
  await notifier.loadDashboardData();
});
