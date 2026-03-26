import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationSetupScreen extends StatefulWidget {
  const NotificationSetupScreen({super.key});

  @override
  State<NotificationSetupScreen> createState() =>
      _NotificationSetupScreenState();
}

class _NotificationSetupScreenState extends State<NotificationSetupScreen> {
  TimeOfDay _breakfastTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _lunchTime = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay _dinnerTime = const TimeOfDay(hour: 19, minute: 0);

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _selectTime(
    TimeOfDay initialTime,
    Function(TimeOfDay) onSelected,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0BC911), // Theme primary color
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != initialTime) {
      setState(() {
        onSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 46,
              ), // Accounting for safe area and top padding
              // Header Texts
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '시작하기 전에',
                  style: TextStyle(
                    fontFamily:
                        'Apple SD Gothic Neo', // Fallback to matching font family
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111811),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '설정을 완료해주세요',
                  style: TextStyle(
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 16,
                    color: Color(0xFF608A62),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Notification Permission Card
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Bell Icon Area
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CAE4F).withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Icon(
                            Icons.notifications_none_rounded,
                            color: Color(0xFF0BC911),
                            size: 24,
                          ),
                          Positioned(
                            bottom: 8,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0BC911),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Texts
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '식사 후 알림을 보내드릴게요',
                            style: TextStyle(
                              fontFamily: 'Apple SD Gothic Neo',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF111811),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '식후 1시간 뒤 컨디션 체크 알림',
                            style: TextStyle(
                              fontFamily: 'Apple SD Gothic Neo',
                              fontSize: 14,
                              color: Color(0xFF608A62),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Allow Button overlapping the card slightly as in standard layouts,
              // but SVG has it positioned inside absolute. We'll place it using a Stack or align.
              // SVG shows it inside the card. Let's adjust the above to use a Stack for the card.
              const SizedBox(height: 20),

              // Meal Time Settings Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header inside card
                    Row(
                      children: [
                        // Clock Icon Area
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFFFB74D,
                                  ).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Icon(
                                Icons.access_time_rounded,
                                color: Color(0xFFFFB74D),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '평소 식사 시간',
                              style: TextStyle(
                                fontFamily: 'Apple SD Gothic Neo',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF111811),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '식사 시간 리마인더를 보내드려요',
                              style: TextStyle(
                                fontFamily: 'Apple SD Gothic Neo',
                                fontSize: 14,
                                color: Color(0xFF608A62),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Time rows
                    _MealTimeRow(
                      emoji: '🌅',
                      circleColor: const Color(0xFFFFB74D),
                      mealName: '아침',
                      timeText: _formatTime(_breakfastTime),
                      onTap: () => _selectTime(
                        _breakfastTime,
                        (time) => _breakfastTime = time,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _MealTimeRow(
                      emoji: '☀️',
                      circleColor: const Color(0xFF4DB6AC),
                      mealName: '점심',
                      timeText: _formatTime(_lunchTime),
                      onTap: () =>
                          _selectTime(_lunchTime, (time) => _lunchTime = time),
                    ),
                    const SizedBox(height: 12),
                    _MealTimeRow(
                      emoji: '🌙',
                      circleColor: const Color(0xFF7986CB),
                      mealName: '저녁',
                      timeText: _formatTime(_dinnerTime),
                      onTap: () => _selectTime(
                        _dinnerTime,
                        (time) => _dinnerTime = time,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // Later Button
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/home'),
                  child: const Text(
                    '나중에 하기',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 14,
                      color: Color(0xFF608A62),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Start Button
              Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => context.go('/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'MyMeal 시작하기',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}

class _MealTimeRow extends StatelessWidget {
  final String emoji;
  final Color circleColor;
  final String mealName;
  final String timeText;
  final VoidCallback onTap;

  const _MealTimeRow({
    required this.emoji,
    required this.circleColor,
    required this.mealName,
    required this.timeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 52, // Adjust slightly to match 44px inner height + padding
        decoration: BoxDecoration(
          color: const Color(0xFFF5F8F6),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(width: 12),
            Text(
              mealName,
              style: const TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111811),
              ),
            ),
            const Spacer(),
            Text(
              timeText,
              style: const TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0BC911),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF608A62),
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
