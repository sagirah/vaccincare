import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.0, 0.7, curve: Curves.easeOut)),
    );

    _scaleAnimation = Tween<double>(begin: 0.88, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack)),
    );

    _animController.forward();

    // Navigate to Onboarding screen after brief display
    Future.delayed(const Duration(milliseconds: 3200), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, anim1, anim2) => const OnboardingScreen(),
            transitionsBuilder: (context, anim1, anim2, child) {
              return FadeTransition(opacity: anim1, child: child);
            },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.splashGradient,
        ),
        child: Stack(
          children: [
            // Ambient Glow in center background
            Center(
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF7839EE).withOpacity(0.18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7839EE).withOpacity(0.25),
                      blurRadius: 100,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),

            // Luminous Curved Wave at the Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 240,
              child: CustomPaint(
                painter: SplashWavePainter(),
                size: Size(MediaQuery.of(context).size.width, 240),
              ),
            ),

            // Main Brand Hero Center Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20),

                    // Center Hero Section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // VacciCare Emblem
                            Container(
                              width: 104,
                              height: 104,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 30,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Icon(
                                    Icons.favorite_rounded,
                                    size: 54,
                                    color: Color(0xFFD8CCF7),
                                  ),
                                  Positioned(
                                    bottom: 24,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.vaccines,
                                        size: 22,
                                        color: Color(0xFF85F7CF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // App Name
                            const Text(
                              'VacciCare',
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -1.0,
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Subtitle
                            const Text(
                              'Child Immunisation Reminder',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFC3B4ED),
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Tagline quote
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              child: const Text(
                                '“Every Vaccine, Right on Time!”',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Motto & Loading Dots
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Healthy Children',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.7),
                                  letterSpacing: 0.8,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('•', style: TextStyle(color: Colors.white.withOpacity(0.4))),
                              ),
                              Text(
                                'Stronger Communities',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.7),
                                  letterSpacing: 0.8,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('•', style: TextStyle(color: Colors.white.withOpacity(0.4))),
                              ),
                              Text(
                                'Brighter Tomorrow',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.7),
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: 32,
                            height: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(3, (index) {
                                return Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(index == 1 ? 0.9 : 0.4),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // First layer
    final paint1 = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0x554D1CB0), Color(0x221B0847)],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    final path1 = Path()
      ..moveTo(0, h * 0.6)
      ..cubicTo(w * 0.25, h * 0.35, w * 0.5, h * 0.75, w, h * 0.4)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    canvas.drawPath(path1, paint1);

    // Second glowing layer
    final paint2 = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0x88692AE8), Color(0x443D1487)],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    final path2 = Path()
      ..moveTo(0, h * 0.75)
      ..cubicTo(w * 0.3, h * 0.5, w * 0.65, h * 0.85, w, h * 0.55)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    canvas.drawPath(path2, paint2);

    // Crest highlight line
    final crestPaint = Paint()
      ..color = const Color(0xFFD4B8FF).withOpacity(0.65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final crestPath = Path()
      ..moveTo(0, h * 0.75)
      ..cubicTo(w * 0.3, h * 0.5, w * 0.65, h * 0.85, w, h * 0.55);

    canvas.drawPath(crestPath, crestPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
