import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class DailyDetailScreen extends StatelessWidget {
  const DailyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    _buildDailyStats(),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text('시간별 기록', style: AppTextStyles.heading3),
                    ),
                    const SizedBox(height: 16),
                    _buildTimelineList(),
                    const SizedBox(height: 32),
                    _buildShareButton(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 28,
                color: AppColors.textPrimary,
              ),
              onPressed: () => context.pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          Text('2월 12일 수요일', style: AppTextStyles.heading2),
        ],
      ),
    );
  }

  Widget _buildDailyStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppCard(
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _statItem('3', '식사', AppColors.textPrimary),
              Container(width: 1, height: 40, color: const Color(0xFFE5E7EB)),
              _statItem('😊', '평균', null, isEmoji: true),
              Container(width: 1, height: 40, color: const Color(0xFFE5E7EB)),
              _statItem('92', '점수', const Color(0xFF0DF214)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(
    String value,
    String label,
    Color? valueColor, {
    bool isEmoji = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontSize: isEmoji ? 28 : 24,
            fontWeight: isEmoji ? FontWeight.normal : FontWeight.w700,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
        // const SizedBox(height: 2), // handled by intrinsic height of text usually, or add tiny space
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildMealCard(
            time: '12:30',
            timeColor: const Color(0xFF4DB6AC),
            imagePath: 'assets/images/meal_donkatsu.png',
            name: '돈까스 정식',
            subtitle: '점심 • 650kcal',
            reaction: '😌',
            reactionColor: const Color(0xFFFFC107),
          ),
          const SizedBox(height: 16),
          _buildMealCard(
            time: '08:15',
            timeColor: const Color(0xFFFFB74D),
            imagePath: 'assets/images/meal_oatmeal_egg.png',
            name: '오트밀와 계란후라이',
            subtitle: '아침 • 380kcal',
            reaction: '😊',
            reactionColor: const Color(0xFF0DF214),
          ),
          const SizedBox(height: 16),
          _buildMealCard(
            time: '15:45',
            timeColor: const Color(0xFFBA68C8),
            imagePath: 'assets/images/meal_americano.png',
            name: '아메리카노',
            subtitle: '간식 • 10kcal',
            reaction: '미기록',
            reactionColor: const Color(0xFFE5E7EB),
            isUnrecordedReaction: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard({
    required String time,
    required Color timeColor,
    required String imagePath,
    required String name,
    required String subtitle,
    required String reaction,
    required Color reactionColor,
    bool isUnrecordedReaction = false,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Real food photo
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.labelLarge),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // Reaction
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isUnrecordedReaction
                      ? reactionColor
                      : reactionColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  reaction,
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: isUnrecordedReaction ? 10 : 14,
                    color: isUnrecordedReaction
                        ? AppColors.textSecondary
                        : null,
                  ),
                ),
              ),
            ],
          ),
          // Time badge & Actions row (Layout adjustment due to stacked visual in SVG)
          // The SVG shows Time Badge floating on left and Actions below Info.
          // Using a stacked or highly custom row for precise SVG match.
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Placed bottom-left in standard flow, matching visual
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: timeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 12,
                    color: timeColor,
                  ),
                ),
              ),
              // Actions
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '수정',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '•',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '삭제',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: const Color(0xFFFF5252),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(26),
          child: Center(
            child: Text(
              '📤 날짜 공유하기',
              style: AppTextStyles.bodyLarge.copyWith(
                color: const Color(0xFF0BC911),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
