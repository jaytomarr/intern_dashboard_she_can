# Flutter Intern Dashboard - Development Specification

## 1. Project Overview

**Project Name:** Flutter Intern Dashboard App
**Project Type:** Mobile App (Flutter)
**Target Audience:** Fundraising Interns
**Core Purpose:** Simple dashboard to track donations, referrals, and view leaderboard with modern UI

## 2. Tech Stack

### Framework & Language
- **Flutter:** Latest stable
- **Dart:** Latest stable

### State Management & Navigation
- **riverpod** (State management)
- **go_router** (Navigation)

### UI & Design
- **google_fonts** (Typography)
- **flutter_animate** (Animations)
- **lucide_icons** (Icons)

### Data Storage
- **shared_preferences** (Local storage)
- **flutter_secure_storage** (Secure data)

## 3. File Structure

```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme/
│       ├── app_theme.dart
│       ├── colors.dart
│       ├── typography.dart
│       └── dimensions.dart
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── mock_data.dart
│   ├── utils/
│   │   ├── extensions.dart
│   │   ├── validators.dart
│   │   └── formatters.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       ├── loading_widget.dart
│       └── animated_card.dart
├── features/
│   ├── auth/
│   │   ├── models/
│   │   │   └── user_model.dart
│   │   ├── pages/
│   │   │   ├── login_page.dart
│   │   │   └── signup_page.dart
│   │   ├── widgets/
│   │   │   ├── auth_form.dart
│   │   │   └── social_login_buttons.dart
│   │   └── providers/
│   │       └── auth_provider.dart
│   ├── dashboard/
│   │   ├── models/
│   │   │   ├── intern_model.dart
│   │   │   └── donation_model.dart
│   │   ├── pages/
│   │   │   └── dashboard_page.dart
│   │   ├── widgets/
│   │   │   ├── stats_card.dart
│   │   │   ├── referral_code_card.dart
│   │   │   └── rewards_section.dart
│   │   └── providers/
│   │       └── dashboard_provider.dart
│   ├── leaderboard/
│   │   ├── models/
│   │   │   └── leaderboard_model.dart
│   │   ├── pages/
│   │   │   └── leaderboard_page.dart
│   │   ├── widgets/
│   │   │   ├── leaderboard_item.dart
│   │   │   └── rank_badge.dart
│   │   └── providers/
│   │       └── leaderboard_provider.dart
│   └── announcements/
│       ├── models/
│       │   └── announcement_model.dart
│       ├── pages/
│       │   └── announcements_page.dart
│       ├── widgets/
│       │   └── announcement_card.dart
│       └── providers/
│           └── announcements_provider.dart
└── shared/
    ├── navigation/
    │   └── bottom_nav_bar.dart
    └── layouts/
        └── main_layout.dart
```

## 4. Data Models

### User Model
```dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String referralCode;
  final double totalDonations;
  final String avatarUrl;
  
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.referralCode,
    required this.totalDonations,
    required this.avatarUrl,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    referralCode: json['referralCode'],
    totalDonations: json['totalDonations'].toDouble(),
    avatarUrl: json['avatarUrl'],
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'referralCode': referralCode,
    'totalDonations': totalDonations,
    'avatarUrl': avatarUrl,
  };
}
```

### Donation Model
```dart
class DonationModel {
  final String id;
  final double amount;
  final DateTime date;
  final String donorName;
  final String status;
  
  const DonationModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.donorName,
    required this.status,
  });
}
```

### Leaderboard Model
```dart
class LeaderboardModel {
  final String userId;
  final String name;
  final double totalDonations;
  final int rank;
  final String avatarUrl;
  
  const LeaderboardModel({
    required this.userId,
    required this.name,
    required this.totalDonations,
    required this.rank,
    required this.avatarUrl,
  });
}
```

### Announcement Model
```dart
class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final String type; // info, success, warning
  final bool isRead;
  
  const AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.type,
    required this.isRead,
  });
}
```

## 5. Navigation Routes (go_router)

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/login',
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
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
      ],
    ),
  ],
);
```

## 6. Theme Configuration

### Color Palette
```dart
class AppColors {
  // Primary Colors
  static const primary = Color(0xFF6366F1);
  static const primaryDark = Color(0xFF4F46E5);
  static const primaryLight = Color(0xFF818CF8);
  
  // Secondary Colors
  static const secondary = Color(0xFF10B981);
  static const accent = Color(0xFFF59E0B);
  
  // Neutral Colors
  static const background = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF1E293B);
  
  // Status Colors
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
}
```

### Typography
```dart
class AppTypography {
  static TextStyle get h1 => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get h2 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle get body1 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
```

## 7. Screen Specifications

### 1. Login/Signup Page
**UI Elements:**
- App logo and title
- Email/password input fields
- Login/Signup toggle
- Social login buttons (Google, Apple - UI only)
- Forgot password link
- Clean gradient background

**Animations:**
- Fade-in form elements
- Button press animations
- Page transition animations

### 2. Dashboard Page
**UI Elements:**
- Welcome message with intern name
- Stats cards showing:
  - Total donations raised (₹5,000)
  - Monthly target progress
  - Referrals count
- Referral code card (yourname2025) with copy button
- Rewards section with achievement badges
- Quick actions buttons

**Mock Data:**
```dart
final mockDashboardData = {
  'totalDonations': 5000.0,
  'monthlyTarget': 10000.0,
  'referralsCount': 12,
  'referralCode': 'INTERN2025',
  'rewards': ['First Donation', 'Week Warrior', '₹1K Milestone']
};
```

### 3. Leaderboard Page
**UI Elements:**
- Top 3 podium design
- List of remaining positions (4-10)
- Current user highlight
- Filter options (Weekly/Monthly/All-time)

**Mock Data:**
```dart
final mockLeaderboardData = [
  {'name': 'Priya Sharma', 'donations': 8500, 'rank': 1},
  {'name': 'Rahul Kumar', 'donations': 7200, 'rank': 2},
  {'name': 'Anjali Singh', 'donations': 6800, 'rank': 3},
  {'name': 'You', 'donations': 5000, 'rank': 4},
  {'name': 'Vikram Patel', 'donations': 4500, 'rank': 5},
];
```

### 4. Announcements Page
**UI Elements:**
- Timeline-style announcement cards
- Different card types (info, success, warning)
- Read/unread indicators
- Date stamps

**Mock Data:**
```dart
final mockAnnouncements = [
  {
    'title': 'New Reward Unlocked!',
    'content': 'Congratulations on reaching ₹5K milestone',
    'type': 'success',
    'date': '2024-01-15'
  },
  {
    'title': 'Weekly Target Reminder',
    'content': 'You\'re 50% towards your weekly goal',
    'type': 'info',
    'date': '2024-01-14'
  }
];
```

## 8. State Management (Riverpod)

### Providers Structure
```dart
// Auth Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Dashboard Provider
final dashboardProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  return DashboardNotifier();
});

// Leaderboard Provider
final leaderboardProvider = FutureProvider<List<LeaderboardModel>>((ref) async {
  return MockDataService.getLeaderboard();
});

// Announcements Provider
final announcementsProvider = FutureProvider<List<AnnouncementModel>>((ref) async {
  return MockDataService.getAnnouncements();
});
```

### State Classes
```dart
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
}

class DashboardState {
  final bool isLoading;
  final String? error;
  final double totalDonations;
  final double monthlyTarget;
  final int referralsCount;
  final List<String> achievements;
  
  const DashboardState({
    this.isLoading = false,
    this.error,
    this.totalDonations = 0.0,
    this.monthlyTarget = 10000.0,
    this.referralsCount = 0,
    this.achievements = const [],
  });
}
```

## 9. UI Components & Widgets

### Custom Widgets
1. **StatsCard** - Animated cards for dashboard statistics
2. **ReferralCodeCard** - Card with copy-to-clipboard functionality
3. **LeaderboardItem** - Individual leaderboard entry with rank badge
4. **AnnouncementCard** - Timeline-style announcement display
5. **AnimatedButton** - Custom button with press animations
6. **GradientBackground** - Reusable gradient backgrounds

### Animations
- **Page transitions:** Slide and fade transitions
- **Card animations:** Scale and fade-in effects
- **Button animations:** Press and ripple effects
- **Loading states:** Shimmer effects for data loading

## 10. Responsive Design

### Breakpoints
- **Mobile:** < 600px (Primary focus)
- **Tablet:** 600px - 900px
- **Desktop:** > 900px (Bonus)

### Design Principles
- Mobile-first approach
- Touch-friendly button sizes (minimum 44px)
- Readable typography with proper contrast
- Consistent spacing using 8px grid system

## 11. Dependencies (pubspec.yaml)

```yaml
name: flutter_intern_dashboard
description: A Flutter app for fundraising intern dashboard
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.16.0"

dependencies:
  flutter:
    sdk: flutter
  
  # State Management & Navigation
  flutter_riverpod: 
  go_router: 
  
  # UI & Design
  google_fonts: 
  flutter_animate: 
  lucide_icons: 
  
  # Storage
  shared_preferences: 
  flutter_secure_storage: 
  
  # Utilities
  intl: 
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: 
```

## 12. Coding Standards

### Naming Conventions
- **Classes:** PascalCase (UserModel, DashboardPage)
- **Variables/Functions:** camelCase (totalDonations, getUserData)
- **Files:** snake_case (user_model.dart, dashboard_page.dart)
- **Constants:** SCREAMING_SNAKE_CASE (API_BASE_URL)

### Code Structure
- Use meaningful variable names
- Add proper documentation for complex functions
- Follow Flutter/Dart style guide
- Use const constructors where possible
- Implement proper error handling

## 13. File-by-File Breakdown

### **Root Level Files**

#### `main.dart`
**Purpose:** App entry point and Riverpod setup
**Contains:**
- `main()` function with `runApp()`
- `ProviderScope` wrapper for Riverpod
- App initialization

#### `pubspec.yaml`
**Purpose:** Project dependencies and metadata
**Contains:**
- Dependencies list
- Asset declarations
- Flutter SDK constraints

### **App Directory (`lib/app/`)**

#### `app.dart`
**Purpose:** Main app widget configuration
**Contains:**
- `MaterialApp.router` setup
- Theme configuration
- Router integration
- Global app settings

#### `router.dart`
**Purpose:** Navigation routes using go_router
**Contains:**
- Route definitions
- Shell routes for bottom navigation
- Route redirects

#### **Theme Directory**

#### `app_theme.dart`
**Purpose:** Main theme setup
**Contains:**
- ThemeData configuration
- Light/dark theme
- Component themes

#### `colors.dart`
**Purpose:** Color constants
**Contains:**
- App color palette
- Status colors
- Gradient definitions

#### `typography.dart`
**Purpose:** Text styles
**Contains:**
- Google Fonts setup
- Text style definitions
- Responsive typography

#### `dimensions.dart`
**Purpose:** Layout constants
**Contains:**
- Spacing values
- Border radius
- Breakpoints

### **Core Directory (`lib/core/`)**

#### `constants/app_constants.dart`
**Purpose:** App-wide constants
**Contains:**
- Default values
- Animation durations
- Configuration values

#### `constants/mock_data.dart`
**Purpose:** Static mock data
**Contains:**
- Sample user data
- Mock dashboard stats
- Test announcements

#### `utils/extensions.dart`
**Purpose:** Dart/Flutter extensions
**Contains:**
- String extensions
- DateTime formatting
- Number formatting

#### `utils/validators.dart`
**Purpose:** Input validation
**Contains:**
- Email validation
- Password validation
- Form validators

#### `utils/formatters.dart`
**Purpose:** Data formatting
**Contains:**
- Currency formatting
- Date formatting
- Text formatters

### **Feature Directories**

Each feature (auth, dashboard, leaderboard, announcements) follows the same structure:

#### `models/`
**Purpose:** Data models with JSON serialization
**Contains:**
- Model classes
- fromJson/toJson methods
- Validation logic

#### `pages/`
**Purpose:** Screen widgets
**Contains:**
- Page layouts
- UI components
- User interactions

#### `widgets/`
**Purpose:** Feature-specific components
**Contains:**
- Reusable widgets
- Custom components
- UI elements

#### `providers/`
**Purpose:** State management
**Contains:**
- Riverpod providers
- State classes
- Business logic

### **Shared Directory (`lib/shared/`)**

#### `navigation/bottom_nav_bar.dart`
**Purpose:** Bottom navigation
**Contains:**
- Navigation tabs
- Active/inactive states
- Route handling

#### `layouts/main_layout.dart`
**Purpose:** App layout wrapper
**Contains:**
- Scaffold setup
- Bottom navigation integration
- Safe area handling

## **Why This Structure Works**

### **Simple & Practical**
- No over-engineering
- Easy to understand
- Quick to implement

### **Feature-Based Organization**
- Each feature is self-contained
- Easy to find related files
- Scalable for new features

### **Clear Separation**
- Models handle data
- Pages handle UI
- Providers handle state
- Widgets handle reusable components

### **AI-Friendly**
- Clear file purposes
- Consistent patterns
- Specific responsibilities
- Easy to extend