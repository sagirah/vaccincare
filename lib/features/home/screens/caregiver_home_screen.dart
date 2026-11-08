import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../schedule/screens/immunisation_record_screen.dart';
import '../../vaccine_details/screens/vaccine_detail_screen.dart';
import '../../facilities/screens/health_facilities_screen.dart';
import '../../alerts/screens/alerts_campaigns_screen.dart';
import '../../ai_companion/screens/ai_health_chat_screen.dart';
import '../../child_management/screens/add_child_screen.dart';
import '../widgets/child_snapshot_card.dart';
import '../widgets/hero_reminder_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/ai_companion_banner.dart';
import '../widgets/health_alert_card.dart';
import '../widgets/nearby_hospital_peek_card.dart';

class CaregiverHomeScreen extends StatelessWidget {
  final AppStateNotifier state;

  const CaregiverHomeScreen({
    super.key,
    required this.state,
  });

  void _showChildSwitcher(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.isHausa ? 'Zabi Yaro' : 'Select Child Profile',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textNavy,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddChildScreen(state: state),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add, size: 16),
                    label: Text(state.isHausa ? 'Kara Yaro' : '+ Add Child'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...state.children.map((child) {
                final isSelected = child.id == state.activeChild.id;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: AppColors.surfaceContainerHigh,
                    child: Text(
                      child.name[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  title: Text(
                    child.name,
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: AppColors.textNavy,
                    ),
                  ),
                  subtitle: Text('${child.ageDisplay} • ${child.nphcdaId}'),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: AppColors.primary)
                      : null,
                  onTap: () {
                    state.switchActiveChild(child);
                    Navigator.pop(ctx);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeChild = state.activeChild;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Caregiver Personal Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Fatima Profile Avatar
                      Stack(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.surfaceContainerHigh,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.25),
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                color: AppColors.primary,
                                size: 26,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: AppColors.tertiaryFixedDim,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.isHausa
                                ? 'Ina kwana, sannu da safe'
                                : 'Good Morning, Fatima',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurfaceVariant,
                              letterSpacing: 0.3,
                            ),
                          ),
                          Text(
                            state.isHausa ? 'Barka da Safiya' : 'Fatima Sadiq',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textNavy,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Language & Notification
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => state.toggleLanguage(),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.translate, size: 15, color: AppColors.primary),
                              const SizedBox(width: 4),
                              Text(
                                state.isHausa ? 'HAU / ENG' : 'ENG / HAU',
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
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          state.setNavIndex(3); // Go to Alerts
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: const BoxDecoration(
                                color: AppColors.surfaceLowest,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.notifications_none_rounded,
                                color: AppColors.onSurfaceVariant,
                                size: 20,
                              ),
                            ),
                            Positioned(
                              top: 7,
                              right: 7,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.errorRed,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Child Profile Snapshot Card
              ChildSnapshotCard(
                child: activeChild,
                isHausa: state.isHausa,
                onViewProfile: () {
                  state.setNavIndex(1); // Go to Schedule tab
                },
                onSwitchChild: () => _showChildSwitcher(context),
              ),

              const SizedBox(height: 16),

              // Hero Royal Purple Reminder Card
              HeroReminderCard(
                childName: activeChild.name.split(' ').first,
                vaccineName: activeChild.nextDoseName,
                dueDate: activeChild.nextDoseDate,
                scope: 'Diphtheria, Tetanus, HepB',
                doseCurrent: 3,
                doseTotal: 3,
                isHausa: state.isHausa,
                onViewSchedule: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VaccineDetailScreen(
                        vaccine: state.doses.firstWhere((d) => d.id == 'penta_3'),
                        state: state,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // 3-Column Quick Actions Grid
              QuickActionsGrid(
                isHausa: state.isHausa,
                onVaccinesTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VaccineDetailScreen(
                        vaccine: state.doses.firstWhere((d) => d.id == 'penta_3'),
                        state: state,
                      ),
                    ),
                  );
                },
                onFacilitiesTap: () {
                  state.setNavIndex(2); // Facilities tab
                },
                onAlertsTap: () {
                  state.setNavIndex(3); // Alerts tab
                },
              ),

              const SizedBox(height: 16),

              // AI Health Companion Prompt Banner
              AiCompanionBanner(
                isHausa: state.isHausa,
                onAskAi: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AiHealthChatScreen(state: state),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Quick Information & Health Alerts Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        state.isHausa ? 'Bayanai Masu Muhimmanci' : 'Quick Information',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textNavy,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => state.setNavIndex(3),
                    child: Row(
                      children: [
                        Text(
                          state.isHausa ? 'Duka' : 'See All',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Alert Card 1: Measles
              HealthAlertCard(
                alert: state.alerts.first,
                isHausa: state.isHausa,
                isAudioPlaying: state.currentlyPlayingAudioId == state.alerts.first.id,
                onToggleAudio: () {
                  state.toggleAudioPlayback(state.alerts.first.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.isHausa
                            ? 'Ana kunna bayanin kyanda a harshen Hausa...'
                            : 'Playing audio guidance in Hausa...',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onAction: () {
                  state.setNavIndex(3);
                },
              ),

              const SizedBox(height: 14),

              // Nearby Hospital Stock Quick Peek
              NearbyHospitalPeekCard(
                facility: state.facilities.first,
                isHausa: state.isHausa,
                onViewFacility: () {
                  state.setNavIndex(2); // Go to facilities
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
