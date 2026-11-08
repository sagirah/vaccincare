import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class QuickActionsGrid extends StatelessWidget {
  final bool isHausa;
  final VoidCallback onVaccinesTap;
  final VoidCallback onFacilitiesTap;
  final VoidCallback onAlertsTap;

  const QuickActionsGrid({
    super.key,
    required this.isHausa,
    required this.onVaccinesTap,
    required this.onFacilitiesTap,
    required this.onAlertsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Action 1: Vaccines
        Expanded(
          child: _ActionTile(
            icon: Icons.vaccines_rounded,
            title: isHausa ? 'Allurai & Bayani' : 'Vaccines & Info',
            subtitle: isHausa ? 'Jagora & Dosi' : 'Guide & Doses',
            onTap: onVaccinesTap,
          ),
        ),
        const SizedBox(width: 10),

        // Action 2: Facilities
        Expanded(
          child: _ActionTile(
            icon: Icons.local_hospital_rounded,
            title: isHausa ? 'Nemi Asibiti' : 'Find Facilities',
            subtitle: isHausa ? 'Akwai Allura' : 'Stock Verified',
            onTap: onFacilitiesTap,
          ),
        ),
        const SizedBox(width: 10),

        // Action 3: Alerts
        Expanded(
          child: _ActionTile(
            icon: Icons.campaign_rounded,
            title: isHausa ? 'Sanarwa' : 'Alerts & News',
            subtitle: isHausa ? 'Yankin Kano' : 'Kano Region',
            hasBadge: true,
            onTap: onAlertsTap,
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool hasBadge;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.hasBadge = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: AppColors.primary,
                  ),
                ),
                if (hasBadge)
                  Positioned(
                    top: 2,
                    right: 2,
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
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
