# Flutter Intern Dashboard

A modern, beautiful Flutter app for fundraising interns to track donations, referrals, and view leaderboards with a premium user experience.

## 🚀 Features

### ✨ Modern UI/UX
- **Curvy Design**: Rounded corners (12px+ border radius) throughout the app
- **Smooth Gradients**: Beautiful gradient backgrounds and cards
- **Glassmorphism Effects**: Frosted glass look where appropriate
- **Micro-animations**: Smooth transitions and hover effects
- **Card-based Design**: Proper elevation and spacing
- **Dark Mode Support**: Full theme system with light/dark modes

### 📱 Screens
1. **Login/Signup Pages**
   - Beautiful gradient backgrounds
   - Smooth form animations
   - Curved input fields with subtle shadows
   - Social login options (UI only)

2. **Dashboard Page**
   - Welcome message with intern name
   - Animated stats cards with count-up animations
   - Referral code card with copy-to-clipboard functionality
   - Achievement badges with unlock animations
   - Grid layout for stats cards

3. **Leaderboard Page**
   - Podium design for top 3 users
   - Rank badges with gradient backgrounds
   - User highlight for current user
   - Filter options (Weekly/Monthly/All-time)

4. **Announcements Page**
   - Timeline-style cards with proper spacing
   - Read/unread indicators
   - Different card styles based on announcement type

### 🎨 Design System
- **Color Palette**: Modern purple/indigo primary colors
- **Typography**: Google Fonts (Inter) with proper hierarchy
- **Spacing**: Consistent 8px grid system
- **Animations**: flutter_animate for smooth interactions
- **Icons**: Lucide Icons for consistent iconography

## 🛠 Tech Stack

- **Framework**: Flutter (latest stable)
- **Language**: Dart
- **State Management**: Riverpod
- **Navigation**: go_router
- **UI Components**: Custom widgets with Material 3
- **Storage**: shared_preferences & flutter_secure_storage
- **Animations**: flutter_animate
- **Icons**: lucide_icons
- **Typography**: google_fonts

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── app/                      # App configuration
│   ├── app.dart             # Main app widget
│   ├── router.dart          # Navigation routes
│   └── theme/               # Theme system
│       ├── app_theme.dart   # Light/dark themes
│       ├── colors.dart      # Color palette
│       ├── typography.dart  # Text styles
│       └── dimensions.dart  # Spacing & dimensions
├── core/                    # Core utilities
│   ├── constants/           # App constants
│   ├── models/              # Data models
│   ├── utils/               # Utilities & extensions
│   └── widgets/             # Reusable widgets
├── features/                # Feature modules
│   ├── auth/                # Authentication
│   ├── dashboard/           # Dashboard
│   ├── leaderboard/         # Leaderboard
│   └── announcements/       # Announcements
└── shared/                  # Shared components
    ├── navigation/          # Navigation components
    └── layouts/             # Layout components
```

## 🎯 Key Features

### Authentication
- Email/password login and signup
- Form validation
- Beautiful gradient backgrounds
- Smooth transitions

### Dashboard
- **Stats Cards**: Total donations, monthly target, referrals, achievements
- **Referral Code**: Copy-to-clipboard functionality
- **Achievement Badges**: Visual progress indicators
- **Quick Actions**: Share referral, view history

### Leaderboard
- **Podium Design**: Top 3 users with different heights
- **Rank Badges**: Gradient badges for each rank
- **User Highlight**: Current user is highlighted
- **Filter Options**: Weekly, monthly, all-time views

### Announcements
- **Timeline Design**: Chronological announcement cards
- **Type Indicators**: Success, warning, info, error types
- **Read/Unread**: Visual indicators for unread items
- **Interactive**: Mark as read functionality

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd intern_dashboard_she_can
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

The app uses mock data for demonstration. To connect to real APIs:

1. Update API endpoints in `lib/core/constants/app_constants.dart`
2. Implement API services in the providers
3. Replace mock data with real API calls

## 🎨 Customization

### Colors
Edit `lib/app/theme/colors.dart` to customize the color palette:

```dart
class AppColors {
  static const primary = Color(0xFF6366F1);
  static const secondary = Color(0xFF10B981);
  // ... more colors
}
```

### Typography
Modify `lib/app/theme/typography.dart` for font changes:

```dart
class AppTypography {
  static TextStyle get h1 => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  // ... more styles
}
```

### Dimensions
Update spacing and dimensions in `lib/app/theme/dimensions.dart`:

```dart
class AppDimensions {
  static const double md = 16.0;
  static const double radiusMd = 12.0;
  // ... more dimensions
}
```

## 📱 Screenshots

The app features:
- **Modern Authentication**: Beautiful login/signup screens
- **Interactive Dashboard**: Animated stats and referral codes
- **Competitive Leaderboard**: Podium design with rankings
- **Timeline Announcements**: Organized communication

## 🔧 Development

### Adding New Features
1. Create feature directory in `lib/features/`
2. Follow the established structure (models, pages, widgets, providers)
3. Add routes in `lib/app/router.dart`
4. Update navigation in `lib/shared/navigation/`

### State Management
The app uses Riverpod for state management:

```dart
// Example provider
final dashboardProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  return DashboardNotifier();
});
```

### Navigation
Routes are defined using go_router:

```dart
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardPage()),
    // ... more routes
  ],
);
```

## 🎯 Future Enhancements

- [ ] Real API integration
- [ ] Push notifications
- [ ] Offline support
- [ ] Analytics integration
- [ ] Multi-language support
- [ ] Advanced animations
- [ ] Social sharing
- [ ] In-app messaging

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For support and questions, please open an issue in the repository.

---

**Built with ❤️ using Flutter**
