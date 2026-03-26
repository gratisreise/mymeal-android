import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      title: '음식 사진을 찍으세요',
      subtitle: '사진 한 장으로\n간편하게 식단을 기록해요',
      illustration: _CameraIllustration(),
    ),
    _OnboardingPageData(
      title: '컨디션을 기록하세요',
      subtitle: '식후 1시간 뒤\n어떤 느낌인지 알려주세요',
      illustration: _ChecklistIllustration(),
    ),
    _OnboardingPageData(
      title: '내 몸에 맞는 식단을\n추천받으세요',
      subtitle: '데이터가 쌓이면\n개인 맞춤 식단을 추천드려요',
      illustration: _PlateIllustration(),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSkip() {
    context.go(
      '/notification_setup',
    ); // Proceed to notification setup after onboarding
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/notification_setup'); // Finish onboarding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Bar with Skip Button
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                right: 30.0,
                bottom: 16.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _onSkip,
                  child: const Text(
                    '건너뛰기',
                    style: TextStyle(
                      fontFamily: 'Apple SD Gothic Neo',
                      fontSize: 16,
                      color: Color(0xFF608A62),
                    ),
                  ),
                ),
              ),
            ),

            // Expandable PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: _pages[index]);
                },
              ),
            ),

            // Bottom Area (Indicators & Button)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 48.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? const Color(0xFF0DF214)
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: _onNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          _currentPage == _pages.length - 1 ? '시작하기' : '다음',
                          style: const TextStyle(
                            fontFamily: 'Apple SD Gothic Neo',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final String title;
  final String subtitle;
  final Widget illustration;

  _OnboardingPageData({
    required this.title,
    required this.subtitle,
    required this.illustration,
  });
}

class _OnboardingPage extends StatelessWidget {
  final _OnboardingPageData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Graphic Placeholder
          SizedBox(height: 240, child: Center(child: data.illustration)),
          const SizedBox(height: 60),

          // Texts
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111811),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 18,
              color: Color(0xFF608A62),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Below are generic Flutter shape representations mimicking the SVG illustrations

class _CameraIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4CAE4F).withOpacity(0.2),
          ),
        ),
        Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
            ),
          ),
          child: Center(
            child: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F8F6),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF0BC911),
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4CAE4F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChecklistIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4CAE4F).withOpacity(0.2),
          ),
        ),
        Container(
          width: 110,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0DF214), Color(0xFF0BC911)],
            ),
          ),
          child: Center(
            child: Container(
              width: 90,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCheckRow(true),
                  _buildCheckRow(false),
                  _buildCheckRow(false),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckRow(bool isChecked) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: isChecked
                ? const Color(0xFF0DF214)
                : const Color(0xFFF5F8F6),
            shape: BoxShape.circle,
            border: isChecked
                ? null
                : Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: isChecked
              ? const Icon(Icons.check, size: 12, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 8,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F8F6),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

class _PlateIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF4CAE4F).withOpacity(0.2),
          ),
        ),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0DF214).withOpacity(0.3),
                const Color(0xFF0BC911).withOpacity(0.3),
              ],
            ),
          ),
        ),
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF0BC911), width: 3),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: _circle(12, const Color(0xFFFFB74D)),
              ),
              Positioned(
                bottom: 25,
                right: 20,
                child: _circle(10, const Color(0xFF4DB6AC)),
              ),
              Positioned(
                top: 35,
                right: 30,
                child: _circle(14, const Color(0xFF7986CB)),
              ),
              Positioned(
                bottom: 25,
                left: 30,
                child: _circle(8, const Color(0xFF0DF214)),
              ),
              Positioned(
                top: 45,
                left: 45,
                child: _circle(9, const Color(0xFFBA68C8)),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 30,
          child: Text('⭐', style: TextStyle(fontSize: 16)),
        ),
        const Positioned(
          bottom: 20,
          left: 20,
          child: Text('✨', style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }

  Widget _circle(double radius, Color color) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
