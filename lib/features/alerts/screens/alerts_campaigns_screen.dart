import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../home/widgets/health_alert_card.dart';

class AlertsCampaignsScreen extends StatelessWidget {
  final AppStateNotifier state;

  const AlertsCampaignsScreen({
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.isHausa ? 'Sanarwa & Yaƙin Neman Allura' : 'Alerts & Campaigns',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
              ),
            ),
            Text(
              state.isHausa ? 'Yankin Kano • Gargadin Lafiya' : 'Kano State Health Advisory Hub',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Region Selector Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded, color: AppColors.primary, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        state.isHausa ? 'Yanki: Jihar Kano (Municipal & Fagge)' : 'Region: Kano State (Municipal & Fagge)',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                      ),
                    ],
                  ),
                  const Icon(Icons.tune_rounded, color: AppColors.outline, size: 18),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Emergency Toll-Free Banner
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDeep],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.phone_in_talk_rounded, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.isHausa ? 'Lambar Taimako ta Kyauta (NPHCDA)' : 'National Health Toll-Free Line',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.tertiaryFixed,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          'Dial 6232 (Zero Call Charges)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Text(
              state.isHausa ? 'Gargadi & Shawarwarin Yanzu' : 'Active Public Health Advisories',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
              ),
            ),

            const SizedBox(height: 10),

            // Alert List
            ...state.alerts.map((alert) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: HealthAlertCard(
                  alert: alert,
                  isHausa: state.isHausa,
                  isAudioPlaying: state.currentlyPlayingAudioId == alert.id,
                  onToggleAudio: () {
                    state.toggleAudioPlayback(alert.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.isHausa
                              ? 'Ana kunna bayani a harshen Hausa...'
                              : 'Playing public health audio advisory in Hausa...',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  onAction: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Viewing campaign details for ${alert.title}')),
                    );
                  },
                ),
              );
            }),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
