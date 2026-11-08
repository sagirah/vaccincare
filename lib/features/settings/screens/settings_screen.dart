import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../certificate/screens/digital_vaccine_certificate_screen.dart';
import '../../child_management/screens/add_child_screen.dart';

class SettingsScreen extends StatelessWidget {
  final AppStateNotifier state;

  const SettingsScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          state.isHausa ? 'Saituna & Karin Bayani' : 'Settings & Preferences',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textNavy,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surfaceContainerHigh,
                      border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 2),
                    ),
                    child: const Center(
                      child: Icon(Icons.person, color: AppColors.primary, size: 30),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Fatima Sadiq',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textNavy,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.verified_rounded, size: 16, color: AppColors.primary),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'sadiqsagirah@gmail.com',
                          style: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          state.isHausa ? 'Babban Mai Kula • Kano' : 'Primary Caregiver • Kano State',
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Registered Children Summary
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddChildScreen(state: state)),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.tertiaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.child_care_rounded, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.isHausa
                                ? 'Yara ${state.children.length} Da Aka Yi Wa Rajista'
                                : '${state.children.length} Children Registered',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                          ),
                          Text(
                            state.children.map((c) => c.name.split(' ').first).join(', '),
                            style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        state.isHausa ? 'Duba' : 'Manage',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Preferences
            Text(
              state.isHausa ? 'Zabin Aikace-aikace' : 'App Preferences',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  // Language Toggle
                  ListTile(
                    leading: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.translate_rounded, color: AppColors.primary, size: 20),
                    ),
                    title: Text(
                      state.isHausa ? 'Harshe' : 'Language',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    subtitle: Text(
                      state.isHausa ? 'Turanci / Hausa' : 'English / Hausa',
                      style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                    ),
                    trailing: Switch(
                      value: state.isHausa,
                      activeColor: AppColors.primary,
                      onChanged: (val) => state.toggleLanguage(),
                    ),
                  ),
                  const Divider(height: 1, indent: 64),

                  // Notifications Toggle
                  ListTile(
                    leading: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.notifications_active_rounded, color: AppColors.primary, size: 20),
                    ),
                    title: Text(
                      state.isHausa ? 'Sanarwar Tunatarwa' : 'SMS & Push Notifications',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    subtitle: Text(
                      state.isHausa ? 'Tunatarwar allura ta SMS kyauta' : 'Free automated SMS reminders before due date',
                      style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                    ),
                    trailing: Switch(
                      value: state.notificationsEnabled,
                      activeColor: AppColors.primary,
                      onChanged: (val) => state.toggleNotifications(val),
                    ),
                  ),
                  const Divider(height: 1, indent: 64),

                  // Digital Passport Shortcut
                  ListTile(
                    leading: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.qr_code_scanner_rounded, color: AppColors.primary, size: 20),
                    ),
                    title: Text(
                      state.isHausa ? 'Shaidar Rigakafi ta Dijital' : 'Digital Vaccine Passport',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textNavy),
                    ),
                    subtitle: const Text(
                      'Official QR & Level 3 NPHCDA Pass',
                      style: TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                    ),
                    trailing: const Icon(Icons.chevron_right, color: AppColors.outline),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DigitalVaccineCertificateScreen(state: state)),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // National Support
            Text(
              state.isHausa ? 'Taimako & Hukuma' : 'Institutional Support',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppColors.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone_in_talk_rounded, color: AppColors.inStockGreen),
                    title: const Text('NPHCDA Toll-Free Help Line (6232)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    subtitle: const Text('Free call across all Nigerian networks', style: TextStyle(fontSize: 11)),
                    trailing: const Icon(Icons.open_in_new_rounded, size: 16, color: AppColors.outline),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dialing NPHCDA Toll-Free Line 6232...')),
                      );
                    },
                  ),
                  const Divider(height: 1, indent: 64),
                  ListTile(
                    leading: const Icon(Icons.shield_outlined, color: AppColors.primary),
                    title: const Text('Zero-Data Policy & Privacy', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    subtitle: const Text('Compliant with Nigeria Data Protection Regulation (NDPR)', style: TextStyle(fontSize: 11)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
