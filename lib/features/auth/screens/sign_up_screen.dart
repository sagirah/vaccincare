import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../navigation/screens/main_navigation_shell.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isHausa = false;
  final TextEditingController _nameController = TextEditingController(text: 'Fatima Sadiq');
  final TextEditingController _phoneController = TextEditingController(text: '803 123 4567');
  String _selectedRole = 'Mother';
  String _selectedState = 'Kano State';
  bool _acceptedTerms = true;

  void _onRegister() {
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
        title: Text(
          _isHausa ? 'Yi Rajista' : 'Create Account',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textNavy,
          ),
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
                child: Text(
                  _isHausa ? 'HAU' : 'EN',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isHausa ? 'Rajistar Mai Kula da Yaro' : 'Caregiver Registration',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textNavy,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _isHausa
                    ? 'Bada bayanan ku domin samun lambar shaida da kwanakin allurar yaranku.'
                    : 'Provide your details to sync records with NPHCDA primary health centers.',
                style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 20),

              // Form Card
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    Text(
                      _isHausa ? 'Cikakken Suna / Sunan Mai Kula' : 'Caregiver Full Name',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_rounded, color: AppColors.outline),
                        hintText: 'e.g. Fatima Sadiq',
                        fillColor: AppColors.surfaceLow,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Phone Number
                    Text(
                      _isHausa ? 'Lambar Waya' : 'Mobile Phone Number',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_outlined, color: AppColors.outline),
                        hintText: '803 123 4567',
                        fillColor: AppColors.surfaceLow,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Relationship to Child
                    Text(
                      _isHausa ? 'Dangantaka da Yaro' : 'Relationship to Child',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: ['Mother', 'Father', 'Guardian'].map((role) {
                        final isSel = _selectedRole == role;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedRole = role),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSel ? AppColors.primary : AppColors.surfaceLow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  role,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: isSel ? Colors.white : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    // State / LGA Selection
                    Text(
                      _isHausa ? 'Jiha & Karamar Hukuma' : 'State & Primary LGA',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedState,
                          isExpanded: true,
                          icon: const Icon(Icons.expand_more_rounded, color: AppColors.primary),
                          items: ['Kano State', 'Kaduna State', 'Katsina State', 'Sokoto State', 'Jigawa State', 'FCT Abuja']
                              .map((st) => DropdownMenuItem(value: st, child: Text(st)))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) setState(() => _selectedState = val);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Terms Checkbox
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _acceptedTerms,
                          activeColor: AppColors.primary,
                          onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _isHausa
                                  ? 'Na yarda a rika aiko mini da sakonnin tunatarwar allura kyauta.'
                                  : 'I agree to receive official NPHCDA immunisation schedule reminders and SMS alerts.',
                              style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: _acceptedTerms ? _onRegister : null,
                      child: Text(
                        _isHausa ? 'Kammala Rajista' : 'Complete Registration',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
