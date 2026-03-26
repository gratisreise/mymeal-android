import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  // Toggle this to see the regular vs empty state
  final bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildTabBar(),
              const SizedBox(height: 16),
              if (_isEmpty) ...[
                const SizedBox(height: 100),
                _buildEmptyState(),
              ] else ...[
                _buildTimeFilter(),
                const SizedBox(height: 24),
                _buildRankingList(),
              ],
              const SizedBox(height: 100), // Padding for BottomNav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration
        SizedBox(
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 15,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 15,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: 20,
                right: 30,
                child: Text('✨', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          '식사 3건 더 기록하면\n첫 인사이트가 생성돼요',
          textAlign: TextAlign.center,
          style: AppTextStyles.heading2.copyWith(height: 1.4),
        ),
        const SizedBox(height: 40),
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '진행률',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '0 / 3',
                style: AppTextStyles.labelMedium.copyWith(
                  color: const Color(0xFF0BC911),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                width: 0, // Placeholder for 0 progress
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF0DF214),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMealIcon('🌅', true),
              const SizedBox(width: 16),
              _buildMealIcon('☀️', false),
              const SizedBox(width: 16),
              _buildMealIcon('🌙', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMealIcon(String emoji, bool isActive) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0DF214) : const Color(0xFFE5E7EB),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(emoji, style: const TextStyle(fontSize: 14)),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Text(
        '인사이트 목록',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TabItem('Best 😊', isActive: true),
          _TabItem('Worst 🤒', isActive: false),
          _TabItem('패턴', isActive: false),
          _TabItem('변화 추이', isActive: false),
        ],
      ),
    );
  }

  Widget _buildTimeFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _FilterChip('최근 1주일', isSelected: false),
          const SizedBox(width: 8),
          _FilterChip('최근 1달', isSelected: true),
          const SizedBox(width: 8),
          _FilterChip('전체', isSelected: false),
        ],
      ),
    );
  }

  Widget _buildRankingList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이번 달 Best 식단',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push('/ranking');
                },
                child: Row(
                  children: [
                    Text(
                      '전체보기',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: AppColors.primaryDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _RankingCard(
            rank: 1,
            badgeColor: const Color(0xFFFFD700), // Gold
            mealName: '아보카도 연어 포케',
            date: '2월 10일 저녁',
            score: 98,
            tags: const ['포만감 좋음', '소화 잘됨'],
            imageUrl: '', // Mock
          ),
          const SizedBox(height: 16),
          _RankingCard(
            rank: 2,
            badgeColor: const Color(0xFFC0C0C0), // Silver
            mealName: '닭가슴살 샐러드',
            date: '2월 8일 점심',
            score: 92,
            tags: const ['가벼움'],
            imageUrl: '', // Mock
          ),
          const SizedBox(height: 16),
          _RankingCard(
            rank: 3,
            badgeColor: const Color(0xFFCD7F32), // Bronze
            mealName: '그릭 요거트 보울',
            date: '2월 11일 아침',
            score: 88,
            tags: const ['속이 편함', '에너지'],
            imageUrl: '', // Mock
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;

  const _TabItem(this.label, {required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? AppColors.primaryDark : AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        if (isActive) Container(height: 2, width: 24, color: AppColors.primary),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip(this.label, {required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? Colors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _RankingCard extends StatelessWidget {
  final int rank;
  final Color badgeColor;
  final String mealName;
  final String date;
  final int score;
  final List<String> tags;
  final String imageUrl;

  const _RankingCard({
    required this.rank,
    required this.badgeColor,
    required this.mealName,
    required this.date,
    required this.score,
    required this.tags,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.shield, color: badgeColor, size: 40),
                  Text(
                    '$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              // Image mock
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.restaurant,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Wrap for tags
                    Wrap(
                      spacing: 4,
                      children: tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.statusGood.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.statusGood,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              // Action Button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add_circle, color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
