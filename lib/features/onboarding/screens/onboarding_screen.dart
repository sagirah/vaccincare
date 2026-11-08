import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../auth/screens/sign_in_screen.dart';
import '../../navigation/screens/main_navigation_shell.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isHausa = false;

  final List<OnboardingData> _pages = [
    const OnboardingData(
      title: 'Healthy Children, Brighter Futures',
      titleHausa: 'Kyakkyawan Riko, Makoma Mai Haske',
      description:
          'Track your child\'s immunisation, get timely reminders, find nearby health facilities, and receive trusted health guidance — all in one place.',
      descriptionHausa:
          'Bi sawun rigakafin yaranku, samu sakonnin tunatarwa a kan lokaci, nemi cibiyoyin lafiya mafi kusa, kuma samu ingantaccen jagora a wuri guda.',
      badgeText: 'NPHCDA Verified',
      icon: Icons.favorite_rounded,
      iconColor: Color(0xFFD8CCF7),
      features: ['SMS Reminders', 'Stock Updates', 'Works Offline'],
    ),
    const OnboardingData(
      title: 'Never Miss a Critical Dose',
      titleHausa: 'Kada a Wuce da Ranar Allura',
      description:
          'Automated reminders for BCG, Pentavalent, Polio, and Measles calibrated to the standard 0–15 month national immunization schedule.',
      descriptionHausa:
          'Tunatarwa ta musamman don allurar BCG, Pentavalent, Shan Inna, da Kyanda daidai da jadawalin kasar na watanni 0 zuwa 15.',
      badgeText: '0–15 Month Protocol',
      icon: Icons.calendar_month_rounded,
      iconColor: Color(0xFF85F7CF),
      features: ['Timely Alerts', 'Batch Tracking', 'Digital Records'],
    ),
    const OnboardingData(
      title: 'Real-Time Facility Vaccine Stock',
      titleHausa: 'Gano Cibiyoyin da Ke da Allura',
      description:
          'Locate primary health centers near you in Kano and beyond with confirmed solar cold-chain inventory before you leave home.',
      descriptionHausa:
          'Gano cibiyoyin lafiya mafi kusa a Kano da kewayenta wadanda ke da wadatattun alluran da aka adana cikin sanyi kafin ku fita.',
      badgeText: 'Cold-Chain Live',
      icon: Icons.local_hospital_rounded,
      iconColor: Color(0xFFFFB4AB),
      features: ['Distance (km)', 'Open Hours', 'Directions'],
    ),
    const OnboardingData(
      title: 'Bilingual AI Health Companion',
      titleHausa: 'Masanin Kiwon Lafiya da Harshen Hausa',
      description:
          'Ask questions 24/7 in English or Hausa regarding post-vaccine fever, normal side effects, or child wellness with clinical guidance.',
      descriptionHausa:
          'Yi tambayoyi a kowane lokaci da harshen Turanci ko Hausa game da zazzabi bayan allura, da shawarwarin lafiyar jarirai.',
      badgeText: 'AI Bilingual Voice',
      icon: Icons.smart_toy_rounded,
      iconColor: Color(0xFFCABEFF),
      features: ['Audio Playback', 'Pediatric Advice', 'Voice Prompts'],
    ),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToMain();
    }
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainNavigationShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Utility Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isHausa = !_isHausa;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.translate, size: 16, color: AppColors.primary),
                          const SizedBox(width: 6),
                          Text(
                            _isHausa ? 'Hausa / EN' : 'EN / Hausa',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _navigateToMain,
                    child: Text(
                      _isHausa ? 'Wuce' : 'Skip',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.outline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page Carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hero Visual Frame with Radiant Glow
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 240,
                              height: 240,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.surfaceContainerHighest.withOpacity(0.5),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 190,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary.withOpacity(0.85),
                                    AppColors.primaryDeep,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.25),
                                    blurRadius: 24,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  page.icon,
                                  size: 80,
                                  color: page.iconColor,
                                ),
                              ),
                            ),

                            // Micro Trust Badge floating bottom right
                            Positioned(
                              bottom: 12,
                              right: 28,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: AppColors.inStockGreen,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      page.badgeText,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.tertiaryContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Title
                        Text(
                          _isHausa ? page.titleHausa : page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textNavy,
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Subtitle
                        Text(
                          _isHausa ? page.descriptionHausa : page.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.onSurfaceVariant,
                            height: 1.45,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Feature Pills
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          alignment: WrapAlignment.center,
                          children: page.features.map((feat) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainer,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                feat,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Stepper Dots & Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  // Dot Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 28 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.primary : AppColors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Get Started / Next Button
                  ElevatedButton(
                    onPressed: _onNext,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentPage == _pages.length - 1
                              ? (_isHausa ? 'Fara Yanzu' : 'Get Started')
                              : (_isHausa ? 'Ci Gaba' : 'Continue'),
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 18),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Already have account button
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: Text(
                      _isHausa ? 'Ina da asusu a baya' : 'I already have an account',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Zero data charges clinical trust guarantee
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.verified_user_outlined, size: 14, color: AppColors.inStockGreen),
                      const SizedBox(width: 4),
                      Text(
                        _isHausa
                            ? 'Babu cajin data a layukan wayar Najeriya'
                            : 'Zero data charges on eligible Nigerian mobile networks',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.outline,
                        ),
                      ),
                    ],
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

class OnboardingData {
  final String title;
  final String titleHausa;
  final String description;
  final String descriptionHausa;
  final String badgeText;
  final IconData icon;
  final Color iconColor;
  final List<String> features;

  const OnboardingData({
    required this.title,
    required this.titleHausa,
    required this.description,
    required this.descriptionHausa,
    required this.badgeText,
    required this.icon,
    required this.iconColor,
    required this.features,
  });
}
