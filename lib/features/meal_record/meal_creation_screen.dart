import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class MealCreationScreen extends StatefulWidget {
  final String mealType;
  final String mealEmoji;
  final Color mealColor;
  final String? imagePath;

  const MealCreationScreen({
    super.key,
    required this.mealType,
    required this.mealEmoji,
    required this.mealColor,
    this.imagePath,
  });

  @override
  State<MealCreationScreen> createState() => _MealCreationScreenState();
}

class _MealCreationScreenState extends State<MealCreationScreen> {
  final TextEditingController _noteController = TextEditingController();

  // Mock AI results based on the generated image
  final List<Map<String, dynamic>> _foodItems = [
    {'name': '그릴드 닭가슴살', 'weight': '150g', 'calories': 195},
    {'name': '신선한 사과', 'weight': '100g', 'calories': 52},
    {'name': '믹스 샐러드', 'weight': '120g', 'calories': 45},
    {'name': '발사믹 드레싱', 'weight': '15g', 'calories': 30},
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('${widget.mealType} 기록하기', style: AppTextStyles.heading3),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildImageSection(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('AI 분석 결과', style: AppTextStyles.labelLarge),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '수정',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildFoodItemsList(),
            const SizedBox(height: 24),
            Text('영양 성분 요약', style: AppTextStyles.labelLarge),
            const SizedBox(height: 12),
            _buildNutritionSummary(),
            const SizedBox(height: 24),
            Text('메모', style: AppTextStyles.labelLarge),
            const SizedBox(height: 12),
            _buildNoteField(),
            const SizedBox(height: 40),
            _buildSaveButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: widget.mealColor.withOpacity(0.1),
          ),
          child: widget.imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: widget.imagePath!.startsWith('http')
                      ? Image.network(widget.imagePath!, fit: BoxFit.cover)
                      : kIsWeb
                      ? Image.network(
                          'https://loremflickr.com/400/400/food,meal?lock=${widget.mealType.hashCode}',
                          fit: BoxFit.cover,
                        )
                      : Image.file(File(widget.imagePath!), fit: BoxFit.cover),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.mealEmoji,
                        style: const TextStyle(fontSize: 48),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '식사 사진',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(widget.mealEmoji, style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 4),
                Text(
                  widget.mealType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodItemsList() {
    return AppCard(
      padding: EdgeInsets.zero,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _foodItems.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: AppColors.divider),
        itemBuilder: (context, index) {
          final item = _foodItems[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            title: Text(item['name'], style: AppTextStyles.bodyMedium),
            subtitle: Text(item['weight'], style: AppTextStyles.bodySmall),
            trailing: Text(
              '${item['calories']} kcal',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNutritionSummary() {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _nutritionStat('총 칼로리', '322', 'kcal', AppColors.primaryDark),
          _verticalDivider(),
          _nutritionStat('탄수화물', '38', 'g', AppColors.textPrimary),
          _verticalDivider(),
          _nutritionStat('단백질', '42', 'g', AppColors.textPrimary),
          _verticalDivider(),
          _nutritionStat('지방', '18', 'g', AppColors.textPrimary),
        ],
      ),
    );
  }

  Widget _nutritionStat(
    String label,
    String value,
    String unit,
    Color valueColor,
  ) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: AppTextStyles.heading3.copyWith(
                  color: valueColor,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: ' $unit',
                style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(height: 30, width: 1, color: AppColors.divider);
  }

  Widget _buildNoteField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _noteController,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: '식사에 대한 느낌이나 메모를 남겨보세요...',
          hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          // Navigate back to home or journal and show success
          context.go('/home');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('식사가 성공적으로 기록되었습니다!'),
              backgroundColor: AppColors.primaryDark,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          '기록 완료',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
