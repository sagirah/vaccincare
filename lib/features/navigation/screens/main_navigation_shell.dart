import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../home/screens/caregiver_home_screen.dart';
import '../../schedule/screens/immunisation_record_screen.dart';
import '../../facilities/screens/health_facilities_screen.dart';
import '../../alerts/screens/alerts_campaigns_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../ai_companion/screens/ai_health_chat_screen.dart';

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  late final AppStateNotifier _stateNotifier;

  @override
  void initState() {
    super.initState();
    _stateNotifier = AppStateNotifier();
    _stateNotifier.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _stateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _stateNotifier.currentNavIndex;
    final isHausa = _stateNotifier.isHausa;

    final List<Widget> pages = [
      CaregiverHomeScreen(state: _stateNotifier),
      ImmunisationRecordScreen(state: _stateNotifier),
      HealthFacilitiesScreen(state: _stateNotifier),
      AlertsCampaignsScreen(state: _stateNotifier),
      SettingsScreen(state: _stateNotifier),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AiHealthChatScreen(state: _stateNotifier),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.smart_toy_rounded, color: Colors.white, size: 26),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceLowest,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  index: 0,
                  icon: Icons.home_rounded,
                  label: isHausa ? 'Gida' : 'Home',
                  isSelected: currentIndex == 0,
                ),
                _navItem(
                  index: 1,
                  icon: Icons.calendar_today_rounded,
                  label: isHausa ? 'Jadawali' : 'Schedule',
                  isSelected: currentIndex == 1,
                ),
                _navItem(
                  index: 2,
                  icon: Icons.location_on_rounded,
                  label: isHausa ? 'Cibiyoyi' : 'Facilities',
                  isSelected: currentIndex == 2,
                ),
                _navItem(
                  index: 3,
                  icon: Icons.notifications_active_rounded,
                  label: isHausa ? 'Sanarwa' : 'Alerts',
                  isSelected: currentIndex == 3,
                  hasBadge: true,
                ),
                _navItem(
                  index: 4,
                  icon: Icons.widgets_rounded,
                  label: isHausa ? 'Kari' : 'More',
                  isSelected: currentIndex == 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
    bool hasBadge = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _stateNotifier.setNavIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.surfaceContainerHigh : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
                ),
                if (hasBadge)
                  Positioned(
                    top: -1,
                    right: -2,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.errorRed,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
