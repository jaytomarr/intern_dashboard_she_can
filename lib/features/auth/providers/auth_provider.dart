import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/user_model.dart';
import '../../../core/constants/mock_data.dart';

// Auth State
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;
  final UserModel? user;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
    UserModel? user,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password are required');
      }

      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      // Mock successful login
      final user = MockData.getCurrentUser();
      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signup(String email, String password, String name) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        throw Exception('All fields are required');
      }

      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      // Mock successful signup
      final user = UserModel(
        id: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        referralCode: '${name.toUpperCase()}2025',
        totalDonations: 0.0,
        avatarUrl:
            'https://i.pravatar.cc/150?img=${DateTime.now().millisecondsSinceEpoch % 20}',
      );

      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void logout() {
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Providers
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

final currentUserProvider = Provider<UserModel?>((ref) {
  return ref.watch(authProvider).user;
});
