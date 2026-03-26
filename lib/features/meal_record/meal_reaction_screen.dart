import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MealReactionScreen extends StatefulWidget {
  const MealReactionScreen({super.key});

  @override
  State<MealReactionScreen> createState() => _MealReactionScreenState();
}

class _MealReactionScreenState extends State<MealReactionScreen> {
  String? _selectedReaction;

  final List<Map<String, dynamic>> _reactions = [
    {
      'id': 'good',
      'emoji': '😊',
      'label': '좋아요',
      'desc': '속이 편안하고 든든해요',
      'color': AppColors.statusGood,
    },
    {
      'id': 'normal',
      'emoji': '😌',
      'label': '보통이에요',
      'desc': '적당하게 잘 먹었어요',
      'color': AppColors.statusNormal,
    },
    {
      'id': 'bad',
      'emoji': '😔',
      'label': '별로예요',
      'desc': '더부룩하거나 불편해요',
      'color': AppColors.statusBad,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text('반응 기록', style: AppTextStyles.heading3),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Meal Info Card mimicking the SVG design
              _buildMealInfoCard(),
              const SizedBox(height: 40),
              Text(
                '식사 후 컨디션은\n어떠신가요?',
                style: AppTextStyles.heading1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '솔직한 반응을 기록하면\n나에게 맞는 식습관을 찾을 수 있어요.',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              // Reaction Cards
              ..._reactions.map((reaction) => _buildReactionCard(reaction)),
              const Spacer(),
              // Save Button
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedReaction != null
                      ? () {
                          // TODO: Save reaction
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('식사 반응이 저장되었습니다!'),
                              backgroundColor: AppColors.primaryDark,
                            ),
                          );
                          context.go('/home');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '기록 완료',
                    style: AppTextStyles.heading3.copyWith(
                      color: _selectedReaction != null
                          ? Colors.white
                          : AppColors.textMuted,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReactionCard(Map<String, dynamic> reaction) {
    final bool isSelected = _selectedReaction == reaction['id'];
    final Color color = reaction['color'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedReaction = reaction['id'];
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? color : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: color.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    reaction['emoji'],
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reaction['label'],
                      style: AppTextStyles.labelLarge.copyWith(
                        color: isSelected ? color : AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reaction['desc'],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check_circle_rounded, color: color, size: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Realistic Tonkatsu Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://loremflickr.com/400/400/tonkatsu,food?lock=1',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Meal Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mealLunch.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    '점심',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mealLunch,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '돈까스 정식',
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Time
          Text(
            '12:30',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
