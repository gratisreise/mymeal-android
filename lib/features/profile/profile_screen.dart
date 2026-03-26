import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Handle
            Container(
              width: 85,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(height: 30),
            // Profile Section
            _buildProfileAvatar(),
            const SizedBox(height: 16),
            Text('김철수', style: AppTextStyles.heading2),
            const SizedBox(height: 4),
            Text(
              'cheolsu@email.com',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // Stats
            _buildStatsBox(),
            const SizedBox(height: 30),
            // Menu Items
            _buildMenuItem(
              icon: '💡',
              iconBgColor: const Color(0xFF4CAE4F).withOpacity(0.2),
              title: '인사이트 상세보기',
              onTap: () {
                context.pop();
                // We use go instead of push to switch bottom navigation tab
                context.go('/insights');
              },
            ),
            _buildMenuItem(
              icon: '⚙️',
              iconBgColor: const Color(0xFFE5E7EB),
              title: '설정',
              onTap: () {
                context.pop(); // close modal
                context.push('/settings'); // go to settings page
              },
            ),
            _buildMenuItem(
              icon: '❓',
              iconBgColor: const Color(0xFFE5E7EB),
              title: '도움말',
              onTap: () {},
            ),
            const SizedBox(height: 30),
            // Close Button
            _buildCloseButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return SizedBox(
      width: 90,
      height: 90,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFE5E7EB),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 20,
            left: 27,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFF608A62),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 27,
            child: CustomPaint(
              size: const Size(36, 18),
              painter: _ShoulderPainter(),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(
                Icons.check,
                size: 16,
                color: Color(0xFF0BC911),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: AppCard(
        backgroundColor: const Color(0xFFF5F8F6),
        border: Border.all(color: Colors.transparent),
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('156', '총 식사', AppColors.textPrimary),
              _buildStatItem('89%', '반응률', AppColors.textPrimary),
              _buildStatItem('7🔥', '스트릭', const Color(0xFF0DF214)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color valueColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value, style: AppTextStyles.heading2.copyWith(color: valueColor)),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(icon, style: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 14),
              Expanded(child: Text(title, style: AppTextStyles.bodyLarge)),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () => context.pop(),
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F8F6),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            '닫기',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _ShoulderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF608A62)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
