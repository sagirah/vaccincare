import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/health_alert.dart';

class HealthAlertCard extends StatelessWidget {
  final HealthAlert alert;
  final bool isHausa;
  final bool isAudioPlaying;
  final VoidCallback onToggleAudio;
  final VoidCallback onAction;

  const HealthAlertCard({
    super.key,
    required this.alert,
    required this.isHausa,
    required this.isAudioPlaying,
    required this.onToggleAudio,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        border: Border.all(
          color: alert.isUrgent
              ? AppColors.errorRed.withOpacity(0.2)
              : AppColors.borderSubtle,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Audio Button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: alert.isUrgent ? AppColors.errorRedBg : AppColors.tertiaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  alert.isUrgent ? Icons.warning_rounded : Icons.health_and_safety_rounded,
                  color: alert.isUrgent ? AppColors.errorRed : AppColors.tertiaryContainer,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          alert.advisoryType.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: alert.isUrgent ? AppColors.errorRed : AppColors.tertiaryContainer,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          ' • ${alert.date}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isHausa ? alert.titleHausa : alert.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textNavy,
                      ),
                    ),
                  ],
                ),
              ),

              // Audio narration in Hausa button
              if (alert.hasAudioHausa)
                GestureDetector(
                  onTap: onToggleAudio,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isAudioPlaying ? AppColors.primary : AppColors.surfaceContainerHigh,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isAudioPlaying ? Icons.graphic_eq_rounded : Icons.volume_up_rounded,
                      size: 18,
                      color: isAudioPlaying ? Colors.white : AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 10),

          // Description
          Text(
            isHausa ? alert.descriptionHausa : alert.description,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.onSurfaceVariant,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 12),

          // Bottom Verification & Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.verified_rounded,
                      size: 15,
                      color: AppColors.inStockGreen,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        alert.highlightText,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.tertiaryContainer,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onAction,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isHausa ? 'Karin Bayani' : alert.ctaText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
