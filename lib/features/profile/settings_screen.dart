import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _recommendationEnabled = true;
  bool _surveyEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F8F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('설정', style: AppTextStyles.heading2),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('알림'),
              const SizedBox(height: 10),
              _buildNotificationSettings(),
              const SizedBox(height: 30),

              _buildSectionTitle('식사 시간'),
              const SizedBox(height: 10),
              _buildMealTimeSettings(),
              const SizedBox(height: 30),

              _buildSectionTitle('데이터 관리'),
              const SizedBox(height: 10),
              _buildDataManagementSettings(),
              const SizedBox(height: 30),

              _buildOtherSettings(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        title,
        style: AppTextStyles.labelMedium.copyWith(
          color: const Color(0xFF608A62),
        ),
      ),
    );
  }

  Widget _buildBox({required List<Widget> children}) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(children: children),
    );
  }

  Widget _buildNotificationSettings() {
    return _buildBox(
      children: [
        _buildToggleRow(
          title: '식사 30분 전 추천',
          subtitle: '식사 시간 전 추천 메뉴 알림',
          value: _recommendationEnabled,
          onChanged: (val) {
            setState(() {
              _recommendationEnabled = val;
            });
          },
        ),
        _buildToggleRow(
          title: '식후 1시간 후 조사',
          subtitle: '컨디션 체크 알림',
          value: _surveyEnabled,
          onChanged: (val) {
            setState(() {
              _surveyEnabled = val;
            });
          },
        ),
      ],
    );
  }

  Widget _buildToggleRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF608A62),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF0BC911),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE5E7EB),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTimeSettings() {
    return _buildBox(
      children: [
        _buildMealTimeRow('🌅', const Color(0xFFFFB74D), '아침', '08:00'),
        _buildMealTimeRow('☀️', const Color(0xFF4DB6AC), '점심', '12:00'),
        _buildMealTimeRow('🌙', const Color(0xFF7986CB), '저녁', '19:00'),
      ],
    );
  }

  Widget _buildMealTimeRow(
    String emoji,
    Color color,
    String title,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(emoji, style: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(width: 12),
          Text(title, style: AppTextStyles.bodyLarge),
          const Spacer(),
          Text(
            time,
            style: AppTextStyles.labelLarge.copyWith(
              color: const Color(0xFF0BC911),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataManagementSettings() {
    return _buildBox(
      children: [
        _buildDataActionRow(
          emoji: '📤',
          color: const Color(0xFFE5E7EB),
          title: '데이터 내보내기',
          titleColor: AppColors.textPrimary,
          showArrow: true,
        ),
        const Divider(
          height: 1,
          color: Color(0xFFE5E7EB),
          indent: 15,
          endIndent: 15,
        ),
        _buildDataActionRow(
          emoji: '🗑️',
          color: const Color(0xFFFF5252).withOpacity(0.15),
          title: '전체 삭제',
          titleColor: const Color(0xFFFF5252),
          showArrow: false,
        ),
        const Divider(
          height: 1,
          color: Color(0xFFE5E7EB),
          indent: 15,
          endIndent: 15,
        ),
        _buildDataActionRow(
          emoji: '👋',
          color: const Color(0xFFFF5252).withOpacity(0.15),
          title: '계정 탈퇴',
          titleColor: const Color(0xFFFF5252),
          showArrow: false,
        ),
      ],
    );
  }

  Widget _buildDataActionRow({
    required String emoji,
    required Color color,
    required String title,
    required Color titleColor,
    required bool showArrow,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(color: titleColor),
            ),
            const Spacer(),
            if (showArrow)
              const Icon(Icons.chevron_right, color: Color(0xFF608A62)),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherSettings() {
    return _buildBox(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('앱 버전', style: AppTextStyles.bodyLarge),
              Text(
                '1.0.0',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF608A62),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Color(0xFFE5E7EB),
          indent: 15,
          endIndent: 15,
        ),
        InkWell(
          onTap: () {
            // handle logout
            context.go('/login');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Text(
                  '로그아웃',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: const Color(0xFFFF5252),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
