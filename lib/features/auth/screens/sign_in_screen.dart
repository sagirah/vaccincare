import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../navigation/screens/main_navigation_shell.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPhone = true;
  bool _isHausa = false;
  final TextEditingController _phoneController = TextEditingController(text: '803 123 4567');
  final TextEditingController _emailController = TextEditingController();

  void _onContinue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainNavigationShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textNavy),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => setState(() => _isHausa = !_isHausa),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.translate, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      _isHausa ? 'HAU' : 'EN',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Brand Emblem
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.favorite_rounded, color: Colors.white, size: 32),
                ),
              ),
              const SizedBox(height: 18),

              // Title
              Text(
                _isHausa ? 'Barka da Dawowa' : 'Welcome Back',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textNavy,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _isHausa
                    ? 'Shiga asusu don duba kwanakin rigakafin yaranku da bayanan asibiti.'
                    : 'Sign in to access your child\'s immunisation schedules and health cards.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Card Container
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Column(
                  children: [
                    // Phone vs Email Segmented Tab
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isPhone = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: _isPhone ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: _isPhone
                                      ? [
                                          BoxShadow(
                                            color: AppColors.primary.withOpacity(0.2),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          )
                                        ]
                                      : null,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone_android_rounded,
                                      size: 16,
                                      color: _isPhone ? Colors.white : AppColors.onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Phone (SMS)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: _isPhone ? Colors.white : AppColors.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isPhone = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: !_isPhone ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: !_isPhone
                                      ? [
                                          BoxShadow(
                                            color: AppColors.primary.withOpacity(0.2),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          )
                                        ]
                                      : null,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      size: 16,
                                      color: !_isPhone ? Colors.white : AppColors.onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Email Address',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: !_isPhone ? Colors.white : AppColors.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (_isPhone) ...[
                      // Phone Input
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _isHausa ? 'Lambar Waya' : 'Phone Number',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textNavy,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLow,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Text('🇳🇬', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 6),
                            const Text(
                              '+234',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textNavy,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(width: 1, height: 20, color: AppColors.surfaceContainerHigh),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: '803 123 4567',
                                  filled: false,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.verified_user_outlined, size: 14, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              _isHausa
                                  ? 'Za a tura lambar tabbatarwa ta SMS.'
                                  : 'We will send a fast SMS OTP code to verify your account.',
                              style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      // Email Input
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _isHausa ? 'Adireshin Imel' : 'Email Address',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textNavy,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_outline_rounded, color: AppColors.outline),
                          hintText: 'fatima.sadiq@gmail.com',
                          fillColor: AppColors.surfaceLow,
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Continue button
                    ElevatedButton(
                      onPressed: _onContinue,
                      child: Text(
                        _isHausa ? 'Ci Gaba (Shiga)' : 'Continue to Dashboard',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Switch to Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isHausa ? 'Ba ka da asusu?' : 'Don\'t have an account?',
                    style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Text(
                      _isHausa ? 'Yi Rajista' : 'Sign Up Here',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
