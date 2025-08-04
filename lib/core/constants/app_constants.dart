class AppConstants {
  // Default Values
  static const double defaultMonthlyTarget = 10000.0;
  static const int defaultReferralsCount = 0;
  static const String defaultReferralCode = 'INTERN2025';

  // Animation Durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationNormal = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // Configuration Values
  static const String appName = 'Intern Dashboard';
  static const String appVersion = '1.0.0';

  // Storage Keys
  static const String userKey = 'user_data';
  static const String authTokenKey = 'auth_token';
  static const String themeKey = 'theme_mode';

  // API Endpoints (for future use)
  static const String baseUrl = 'https://api.example.com';
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  static const String dashboardEndpoint = '/dashboard';
  static const String leaderboardEndpoint = '/leaderboard';
  static const String announcementsEndpoint = '/announcements';
}
