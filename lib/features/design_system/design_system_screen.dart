import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class DesignSystemScreen extends StatelessWidget {
  const DesignSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Design System',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Color Palette ───────────────────────────────
            _buildSectionTitle('Color Palette'),
            const SizedBox(height: 16),

            _buildSubSectionTitle('Primary'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Primary', AppColors.primary, '0xFF0DF214'),
                const SizedBox(width: 8),
                _buildColorCard('Primary Dark', AppColors.primaryDark, '0xFF0BC911'),
                const SizedBox(width: 8),
                _buildColorCard('Primary Light', AppColors.primaryLight, '0xFF4CAE4F'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Backgrounds & Surfaces'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Background', AppColors.background, '0xFFF5F8F6'),
                const SizedBox(width: 8),
                _buildColorCard('Surface', AppColors.surface, '0xFFFFFFFF'),
                const SizedBox(width: 8),
                _buildColorCard('Surface Dark', AppColors.surfaceDark, '0xFF111811'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Text'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Text Primary', AppColors.textPrimary, '0xFF111811'),
                const SizedBox(width: 8),
                _buildColorCard('Text Secondary', AppColors.textSecondary, '0xFF608A62'),
                const SizedBox(width: 8),
                _buildColorCard('Text Muted', AppColors.textMuted, '0xFF6B7280'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Meal Types'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Breakfast', AppColors.mealBreakfast, '0xFFFFB74D'),
                const SizedBox(width: 8),
                _buildColorCard('Lunch', AppColors.mealLunch, '0xFF4DB6AC'),
                const SizedBox(width: 8),
                _buildColorCard('Dinner', AppColors.mealDinner, '0xFF7986CB'),
                const SizedBox(width: 8),
                _buildColorCard('Snack', AppColors.mealSnack, '0xFFBA68C8'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Status'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Good', AppColors.statusGood, '0xFF0DF214'),
                const SizedBox(width: 8),
                _buildColorCard('Normal', AppColors.statusNormal, '0xFFFFC107'),
                const SizedBox(width: 8),
                _buildColorCard('Bad', AppColors.statusBad, '0xFFFF5252'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Badges (Rankings)'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Gold', AppColors.badgeGold, '0xFFFFC107'),
                const SizedBox(width: 8),
                _buildColorCard('Silver', AppColors.badgeSilver, '0xFFC0C0C0'),
                const SizedBox(width: 8),
                _buildColorCard('Bronze', AppColors.badgeBronze, '0xFFCD7F32'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('UI Elements'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColorCard('Border', AppColors.border, '0xFFE5E7EB'),
                const SizedBox(width: 8),
                _buildColorCard('Divider', AppColors.divider, '0xFFF3F4F6'),
              ],
            ),
            const SizedBox(height: 20),

            _buildSubSectionTitle('Gradient'),
            const SizedBox(height: 8),
            Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Primary Gradient',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // ─── Typography ─────────────────────────────────
            _buildSectionTitle('Typography'),
            const SizedBox(height: 16),

            _buildTypographyItem('Heading 1', AppTextStyles.heading1, '24px / Bold'),
            _buildTypographyItem('Heading 2', AppTextStyles.heading2, '20px / Bold'),
            _buildTypographyItem('Heading 3', AppTextStyles.heading3, '18px / Bold'),
            const Divider(color: AppColors.divider, height: 32),
            _buildTypographyItem('Body Large', AppTextStyles.bodyLarge, '16px / Medium'),
            _buildTypographyItem('Body Medium', AppTextStyles.bodyMedium, '14px / Medium'),
            _buildTypographyItem('Body Small', AppTextStyles.bodySmall, '12px / Medium'),
            const Divider(color: AppColors.divider, height: 32),
            _buildTypographyItem('Label Large', AppTextStyles.labelLarge, '16px / SemiBold'),
            _buildTypographyItem('Label Medium', AppTextStyles.labelMedium, '14px / SemiBold'),
            _buildTypographyItem('Label Small', AppTextStyles.labelSmall, '11px / Medium'),
            const SizedBox(height: 40),

            // ─── Components ─────────────────────────────────
            _buildSectionTitle('Components'),
            const SizedBox(height: 16),

            // AppCard
            _buildSubSectionTitle('AppCard'),
            const SizedBox(height: 8),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AppCard 기본', style: AppTextStyles.labelLarge),
                  const SizedBox(height: 4),
                  Text(
                    'padding: 16, borderRadius: 16, border: AppColors.border',
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            _buildSubSectionTitle('Buttons'),
            const SizedBox(height: 8),
            // Primary Gradient Button
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Primary Gradient Button',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Outlined Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Outlined Button',
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.primaryDark),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Text Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Text Button',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Input Fields
            _buildSubSectionTitle('Input Fields'),
            const SizedBox(height: 8),
            _buildInputField(label: '이메일', hintText: 'example@email.com', prefixIcon: Icons.email_outlined),
            const SizedBox(height: 12),
            _buildInputField(label: '비밀번호', hintText: '비밀번호를 입력하세요', prefixIcon: Icons.lock_outline, suffixIcon: Icons.visibility_off_outlined, obscureText: true),
            const SizedBox(height: 24),

            // Social Buttons
            _buildSubSectionTitle('Social Login Buttons'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSocialButton(icon: Icons.chat_bubble, color: const Color(0xFFFEE500), iconColor: const Color(0xFF111811), label: 'Kakao'),
                const SizedBox(width: 16),
                _buildSocialButtonText(text: 'N', color: const Color(0xFF03C75A), textColor: Colors.white, label: 'Naver'),
                const SizedBox(width: 16),
                _buildSocialButton(icon: Icons.g_mobiledata_rounded, color: Colors.white, iconColor: const Color(0xFF111811), label: 'Google', hasBorder: true),
              ],
            ),
            const SizedBox(height: 24),

            // Meal Type Icons
            _buildSubSectionTitle('Meal Type Icons'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMealTypeIcon('🌅', AppColors.mealBreakfast, '아침', isCompleted: true),
                _buildMealTypeIcon('☀️', AppColors.mealLunch, '점심', isCompleted: true),
                _buildMealTypeIcon('🌙', AppColors.mealDinner, '저녁', isCompleted: false),
                _buildMealTypeIcon('🍪', AppColors.mealSnack, '간식', isCompleted: false),
              ],
            ),
            const SizedBox(height: 24),

            // Status Badges
            _buildSubSectionTitle('Status Badges'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildStatusBadge('😊', '좋아요', AppColors.statusGood),
                const SizedBox(width: 16),
                _buildStatusBadge('😌', '보통', AppColors.statusNormal),
                const SizedBox(width: 16),
                _buildStatusBadge('😣', '별로', AppColors.statusBad),
              ],
            ),
            const SizedBox(height: 24),

            // Ranking Badges
            _buildSubSectionTitle('Ranking Badges'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildRankBadge('🥇', '1위', AppColors.badgeGold),
                const SizedBox(width: 16),
                _buildRankBadge('🥈', '2위', AppColors.badgeSilver),
                const SizedBox(width: 16),
                _buildRankBadge('🥉', '3위', AppColors.badgeBronze),
              ],
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // ─── Section Builders ───────────────────────────────────

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.heading1),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildSubSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.labelMedium.copyWith(
        color: AppColors.textSecondary,
        letterSpacing: 0.5,
      ),
    );
  }

  // ─── Color Card ─────────────────────────────────────────

  Expanded _buildColorCard(String name, Color color, String hex) {
    final bool isDark = ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: color == Colors.white || color == AppColors.background || color == AppColors.divider
              ? Border.all(color: AppColors.border)
              : null,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              hex.replaceAll('0xFF', '#'),
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Typography Item ────────────────────────────────────

  Widget _buildTypographyItem(String name, TextStyle style, String spec) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: AppTextStyles.labelSmall),
              Text(spec, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textMuted)),
            ],
          ),
          const SizedBox(height: 6),
          Text('안녕하세요, MyMeal 디자인 시스템', style: style),
        ],
      ),
    );
  }

  // ─── Input Field ────────────────────────────────────────

  Widget _buildInputField({
    required String label,
    required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            obscureText: obscureText,
            style: AppTextStyles.bodyLarge,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppColors.textSecondary, size: 22)
                  : null,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: AppColors.textMuted, size: 22)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Social Buttons ─────────────────────────────────────

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required String label,
    bool hasBorder = false,
  }) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: hasBorder ? Border.all(color: AppColors.border) : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }

  Widget _buildSocialButtonText({
    required String text,
    required Color color,
    required Color textColor,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }

  // ─── Meal Type Icon ─────────────────────────────────────

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
                color: isCompleted ? color.withOpacity(0.15) : AppColors.background,
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
                    color: isCompleted ? null : AppColors.textMuted.withOpacity(0.5),
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
            color: isCompleted ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          isCompleted ? '완료' : '미완료',
          style: TextStyle(
            fontSize: 10,
            color: isCompleted ? color : AppColors.textMuted,
          ),
        ),
      ],
    );
  }

  // ─── Status Badge ───────────────────────────────────────

  Widget _buildStatusBadge(String emoji, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 24)),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  // ─── Rank Badge ─────────────────────────────────────────

  Widget _buildRankBadge(String emoji, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
