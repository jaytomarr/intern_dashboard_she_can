import 'package:go_router/go_router.dart';
import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/signup_page.dart';
import '../features/dashboard/pages/dashboard_page.dart';
import '../features/leaderboard/pages/leaderboard_page.dart';
import '../features/announcements/pages/announcements_page.dart';
import '../features/profile/pages/profile_page.dart';
import '../shared/layouts/main_layout.dart';
import '../shared/widgets/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/', redirect: (context, state) => '/splash'),
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: '/leaderboard',
          builder: (context, state) => const LeaderboardPage(),
        ),
        GoRoute(
          path: '/announcements',
          builder: (context, state) => const AnnouncementsPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
