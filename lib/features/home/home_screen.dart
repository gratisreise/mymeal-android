import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Toggle this to see the regular vs empty state
  final bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            if (_isEmpty)
              Expanded(child: _buildEmptyState())
            else ...[
              const SizedBox(height: 16),
              _buildTodaysMealCard(),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('식사 기록', style: AppTextStyles.heading3),
                    Icon(Icons.tune, color: AppColors.textSecondary, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildMealCard(
                      context,
                      type: '점심',
                      typeColor: AppColors.mealLunch,
                      emoji: '🍱',
                      name: '돈까스 정식',
                      time: '12:30',
                      reactionEmoji: '😌',
                      reactionColor: AppColors.statusNormal,
                    ),
                    const SizedBox(height: 16),
                    _buildMealCard(
                      context,
                      type: '아침',
                      typeColor: AppColors.mealBreakfast,
                      emoji: '🥣',
                      name: '오트밀과 계란후라이',
                      time: '08:15',
                      reactionEmoji: '😊',
                      reactionColor: AppColors.statusGood,
                    ),
                    const SizedBox(height: 32),
                    _buildEmptyStateHint(),
                    const SizedBox(height: 100), // Padding for BottomNav + FAB
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Illustration
        SizedBox(
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F8F6),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAE4F),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0BC911), width: 2),
                ),
              ),
              const Positioned(
                top: 20,
                right: 30,
                child: Text('✨', style: TextStyle(fontSize: 20)),
              ),
              const Positioned(
                bottom: 30,
                left: 30,
                child: Text('🌟', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          '첫 식사를 기록해볼까요?',
          style: AppTextStyles.heading1.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 10),
        Text(
          '사진 한 장으로 간편하게 식단을 기록해요',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(28),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF0BC911),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '식사 기록하기',
                    style: AppTextStyles.heading3.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요, 준호님! 👋',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('좋은 식사 하셨나요?', style: AppTextStyles.heading2),
                ],
              ),
              // Profile Mock
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(
                  child: Text('👤', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildDatePicker(),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: AppColors.primary,
            ),
            const SizedBox(width: 8),
            Text(
              '2025년 2월 12일 수요일',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            '오늘',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTodaysMealCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '오늘의 식단 진행도',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '골고루 잘 챙겨 먹고 있어요! 🎉',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                Text(
                  '2/4',
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMealTypeIcon(
                  '🌅',
                  AppColors.mealBreakfast,
                  '아침',
                  isCompleted: true,
                ),
                _buildMealTypeIcon(
                  '☀️',
                  AppColors.mealLunch,
                  '점심',
                  isCompleted: true,
                ),
                _buildMealTypeIcon(
                  '🌙',
                  AppColors.border,
                  '저녁',
                  isCompleted: false,
                ),
                _buildMealTypeIcon(
                  '🍪',
                  AppColors.border,
                  '간식',
                  isCompleted: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealTypeIcon(
    String emoji,
    Color color,
    String label, {
    required bool isCompleted,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isCompleted
                    ? color.withOpacity(0.15)
                    : AppColors.background,
                shape: BoxShape.circle,
                border: isCompleted
                    ? Border.all(color: color.withOpacity(0.5), width: 1.5)
                    : Border.all(color: AppColors.border, width: 1.5),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(
                    fontSize: 22,
                    color: isCompleted
                        ? null
                        : AppColors.textMuted.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            if (isCompleted)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isCompleted ? FontWeight.w600 : FontWeight.normal,
            color: isCompleted
                ? AppColors.textPrimary
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMealCard(
    BuildContext context, {
    required String type,
    required Color typeColor,
    required String emoji,
    required String name,
    required String time,
    required String reactionEmoji,
    required Color reactionColor,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Thumbnail mock
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://loremflickr.com/100/100/food,meal?lock=${name.hashCode}',
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: typeColor.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 32)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          // Info map
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: typeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: typeColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(time, style: AppTextStyles.bodySmall),
                  ],
                ),
                const SizedBox(height: 8),
                Text(name, style: AppTextStyles.labelLarge),
              ],
            ),
          ),
          // Reaction
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: reactionColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    reactionEmoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                reactionEmoji == '😊' ? '좋아요' : '보통',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: reactionColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateHint() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border), // Note: Should be dashed
        ),
        child: const Text(
          '저녁 식사를 기록해볼까요?',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
