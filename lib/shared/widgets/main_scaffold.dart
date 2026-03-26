import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../features/meal_record/meal_type_select_sheet.dart';

import '../../features/profile/profile_screen.dart'; // To access ProfileModal

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // We calculate the current index based on the route location
    final String location = GoRouterState.of(context).matchedLocation;
    int currentIndex = _calculateSelectedIndex(location);

    return Scaffold(
      body: child,
      // Custom FAB overlapping the bottom navigation bar
      floatingActionButton: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color: AppColors.primary.withOpacity(0.5),
            width: 4,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            MealTypeSelectSheet.show(context);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.surface,
        elevation: 10,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, '🏠', '홈', 0, currentIndex, '/home'),
              _buildNavItem(
                context,
                '💡',
                '인사이트',
                1,
                currentIndex,
                '/insights',
              ),
              const SizedBox(width: 48), // Space for FAB
              _buildNavItem(context, '📅', '캘린더', 2, currentIndex, '/journal'),
              _buildNavItem(context, '👤', '프로필', 3, currentIndex, '/profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String icon,
    String label,
    int index,
    int currentIndex,
    String route,
  ) {
    final bool isSelected = index == currentIndex;

    return InkWell(
      onTap: () {
        if (index == 3) {
          // Show Profile Modal instead of routing
          _showProfileModal(context);
        } else {
          context.go(route);
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected && index != 3
              ? AppColors.primary.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: TextStyle(
                fontSize: 20,
                color: isSelected && index != 3
                    ? null
                    : AppColors.textSecondary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected && index != 3
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: isSelected && index != 3
                    ? AppColors.primaryDark
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ProfileModal(),
    );
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/insights')) return 1;
    if (location.startsWith('/journal')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0; // Default to home
  }
}
