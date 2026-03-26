import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class CameraScreen extends StatefulWidget {
  final String mealType; // e.g., '점심'
  final Color mealColor; // e.g., AppColors.mealLunch
  final String mealEmoji; // e.g., '☀️'

  const CameraScreen({
    super.key,
    required this.mealType,
    required this.mealColor,
    required this.mealEmoji,
  });

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _controller = CameraController(_cameras[0], ResolutionPreset.high);
        await _controller!.initialize();
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildCameraPreview(),
            const Spacer(),
            _buildMealTypeTabs(),
            const SizedBox(height: 30),
            _buildBottomControls(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
          Text(
            '${widget.mealType} 식사 인증하기',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.flash_off, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: 400,
          color: const Color(0xFF2A2A2A),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://loremflickr.com/400/400/food,meal?lock=${widget.mealType.hashCode}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '📷',
                          style: TextStyle(fontSize: 48, color: Colors.white30),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '식사를 찍어주세요',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Corner guides mock
              _buildCornerGuide(Alignment.topLeft),
              _buildCornerGuide(Alignment.topRight),
              _buildCornerGuide(Alignment.bottomLeft),
              _buildCornerGuide(Alignment.bottomRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCornerGuide(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 30,
          height: 30,
          child: CustomPaint(
            painter: CornerPainter(
              alignment: alignment,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMealTypeTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.textPrimary.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTabItem('🌅', false),
            _buildTabItem('☀️', true), // Mock active lunch
            _buildTabItem('🌙', false),
            _buildTabItem('🍪', false),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String emoji, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? widget.mealColor : AppColors.border,
        shape: BoxShape.circle,
      ),
      child: Center(child: Text(emoji, style: const TextStyle(fontSize: 16))),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gallery
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.photo_library, color: Colors.white),
          ),
          // Shutter
          GestureDetector(
            onTap: () {
              // In a real app, you'd capture the image here.
              // For now, we simulate success and pass the path to the generated image.
              context.push(
                '/meal-creation',
                extra: {
                  'mealType': widget.mealType,
                  'mealEmoji': widget.mealEmoji,
                  'mealColor': widget.mealColor,
                  'imagePath':
                      '/Users/junghokim/.gemini/antigravity/brain/aab22524-ff1c-4a69-8715-45f6f2211431/meal_recognition_result_1772596404291.png',
                },
              );
            },
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 3,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.primaryGradient,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Flip camera
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.flip_camera_ios, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  final Alignment alignment;
  final Color color;

  CornerPainter({required this.alignment, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (alignment == Alignment.topLeft) {
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else if (alignment == Alignment.topRight) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else if (alignment == Alignment.bottomLeft) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else if (alignment == Alignment.bottomRight) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
