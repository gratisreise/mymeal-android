import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Mock data for calendar dots
  final Map<DateTime, Map<String, dynamic>> _mealEvents = {
    DateTime(2025, 2, 1): {'totalMeals': 3, 'condition': 'good'},
    DateTime(2025, 2, 3): {'totalMeals': 2, 'condition': 'normal'},
    DateTime(2025, 2, 4): {'totalMeals': 3, 'condition': 'good'},
    DateTime(2025, 2, 5): {'totalMeals': 3, 'condition': 'good'},
    DateTime(2025, 2, 7): {'totalMeals': 1, 'condition': 'bad'},
    DateTime(2025, 2, 9): {'totalMeals': 3, 'condition': 'good'},
    DateTime(2025, 2, 10): {'totalMeals': 3, 'condition': 'good'},
    DateTime(2025, 2, 12): {'totalMeals': 2, 'condition': 'good'},
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 10),
              _buildCalendarCard(),
              const SizedBox(height: 20),
              _buildLegend(),
              const SizedBox(height: 20),
              _buildSummaryCard(),
              const SizedBox(height: 40),
              _buildSelectedDayHeader(),
              _buildMealListForSelectedDay(),
              const SizedBox(height: 100), // Padding for BottomNav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('yyyy년 M월').format(_focusedDay),
            style: AppTextStyles.heading2,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: AppColors.textSecondary,
                ),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month - 1,
                    );
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month + 1,
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppCard(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            // Navigate or update UI for the selected day
            context.push('/daily_detail');
          },
          headerVisible: false,
          daysOfWeekHeight: 40,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            weekendStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.statusBad,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: AppTextStyles.bodyMedium,
            weekendTextStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.statusBad,
            ),
            outsideTextStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.border,
            ),
            todayDecoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            todayTextStyle: AppTextStyles.labelMedium.copyWith(
              color: AppColors.primaryDark,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            selectedTextStyle: AppTextStyles.labelMedium.copyWith(
              color: Colors.white,
            ),
            cellMargin: const EdgeInsets.all(4),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              final dayWithoutTime = DateTime(date.year, date.month, date.day);
              final data = _mealEvents[dayWithoutTime];
              if (data == null) return null;

              Color dotColor;
              switch (data['condition']) {
                case 'good':
                  dotColor = AppColors.statusGood;
                  break;
                case 'bad':
                  dotColor = AppColors.statusBad;
                  break;
                case 'normal':
                default:
                  dotColor = AppColors.statusNormal;
              }

              double radius = 3.0;
              if (data['totalMeals'] == 2) radius = 4.0;
              if (data['totalMeals'] >= 3) radius = 5.0;

              return Positioned(
                bottom: 8,
                child: Container(
                  width: radius * 2,
                  height: radius * 2,
                  decoration: BoxDecoration(
                    color: isSameDay(_selectedDay, date)
                        ? Colors.white
                        : dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '색상으로 컨디션 확인',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _legendItem(AppColors.statusGood, '좋음'),
              const SizedBox(width: 16),
              _legendItem(AppColors.statusNormal, '보통'),
              const SizedBox(width: 16),
              _legendItem(AppColors.statusBad, '나쁨'),
              const Spacer(),
              Text(
                '점 크기 = 식사 횟수',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.bodySmall),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${DateFormat('M월').format(_focusedDay)} 요약',
                  style: AppTextStyles.labelMedium,
                ),
                const Icon(Icons.insights, color: AppColors.primary, size: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _summaryStat('18일', '기록 기간', null),
                _summaryStat('😊', '평균 컨디션', null, isEmoji: true),
                _summaryStat('85%', '전체 평균', AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryStat(
    String value,
    String label,
    Color? valueColor, {
    bool isEmoji = false,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: isEmoji
              ? const TextStyle(fontSize: 24)
              : AppTextStyles.heading3.copyWith(
                  color: valueColor ?? AppColors.textPrimary,
                ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }

  Widget _buildSelectedDayHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selectedDay == null
                ? '날짜를 선택하세요'
                : DateFormat('M월 d일 식사 기록').format(_selectedDay!),
            style: AppTextStyles.labelLarge,
          ),
          if (_selectedDay != null)
            Text(
              '총 3회',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primaryDark,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMealListForSelectedDay() {
    // Placeholder list for the selected day
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final meals = ['아침 식사', '점심 식사', '저녁 식사'];
        final times = ['08:30 AM', '12:45 PM', '07:20 PM'];
        final emojis = ['🥣', '🥗', '🥘'];
        final scores = ['좋음', '최고', '보통'];

        return AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://loremflickr.com/100/100/food,meal?lock=${meals[index].hashCode}',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        emojis[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meals[index], style: AppTextStyles.labelMedium),
                    const SizedBox(height: 4),
                    Text(times[index], style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: scores[index] == '보통'
                      ? AppColors.statusNormal.withOpacity(0.1)
                      : AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  scores[index],
                  style: AppTextStyles.labelSmall.copyWith(
                    color: scores[index] == '보통'
                        ? AppColors.statusNormal
                        : AppColors.primaryDark,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
