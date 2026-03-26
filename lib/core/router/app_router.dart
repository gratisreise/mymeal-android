import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/main_scaffold.dart';
import '../../features/home/home_screen.dart';
import '../../features/meal_record/camera_screen.dart';
import '../../features/insights/insights_screen.dart';
import '../../features/journal/journal_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/signup_screen.dart';

import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/notification_setup_screen.dart';
import '../../features/onboarding/notification_arrival_screen.dart';
import '../../features/profile/settings_screen.dart';
import '../../features/meal_record/meal_creation_screen.dart'; // Added import for MealCreationScreen
import '../../features/meal_record/meal_reaction_screen.dart';
import '../../features/ranking/meal_ranking_screen.dart';
import '../../features/design_system/design_system_screen.dart';
import '../../features/journal/daily_detail_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/meal-reaction',
    routes: [
      GoRoute(
        path: '/notification_setup',
        builder: (context, state) => const NotificationSetupScreen(),
      ),
      GoRoute(
        path: '/notification_arrival',
        builder: (context, state) => const NotificationArrivalScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/settings', // New top-level route for settings
        builder: (context, state) => const SettingsScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/insights',
            builder: (context, state) => const InsightsScreen(),
          ),
          GoRoute(
            path: '/journal',
            builder: (context, state) => const JournalScreen(),
          ),
          GoRoute(
            path: '/ranking',
            builder: (context, state) => const MealRankingScreen(),
          ),
          // Removed '/profile' route from ShellRoute as per instruction
        ],
      ),
      GoRoute(
        path: '/camera',
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          return CameraScreen(
            mealType: extras?['mealType'] ?? '식사',
            mealColor: extras?['mealColor'] ?? Colors.green,
            mealEmoji: extras?['mealEmoji'] ?? '🍽️',
          );
        },
      ),
      GoRoute(
        path: '/meal-creation',
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;
          return MealCreationScreen(
            mealType: extras?['mealType'] ?? '점심',
            mealEmoji: extras?['mealEmoji'] ?? '☀️',
            mealColor: extras?['mealColor'] ?? Colors.orange,
            imagePath:
                extras?['imagePath'] ??
                'https://loremflickr.com/400/400/food,meal',
          );
        },
      ),
      GoRoute(
        path: '/meal-reaction',
        builder: (context, state) => const MealReactionScreen(),
      ),
      GoRoute(
        path: '/design-system',
        builder: (context, state) => const DesignSystemScreen(),
      ),
      GoRoute(
        path: '/daily-detail',
        builder: (context, state) => const DailyDetailScreen(),
      ),
    ],
  );
}
