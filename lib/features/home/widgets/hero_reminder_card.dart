import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HeroReminderCard extends StatelessWidget {
  final String childName;
  final String vaccineName;
  final String dueDate;
  final String scope;
  final int doseCurrent;
  final int doseTotal;
  final bool isHausa;
  final VoidCallback onViewSchedule;

  const HeroReminderCard({
    super.key,
    required this.childName,
    required this.vaccineName,
    required this.dueDate,
    required this.scope,
    required this.doseCurrent,
    required this.doseTotal,
    required this.isHausa,
    required this.onViewSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.heroPurpleGradient,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Stack(
        children: [
          // Ambient watermark circular accents
          Positioned(
            right: -24,
            bottom: -24,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),
          Positioned(
            right: -10,
            top: -30,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),

          // Main Card Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Title & Icon
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            isHausa ? 'JADAWALIN GAGGAWA' : 'CRITICAL SCHEDULE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: AppColors.onPrimaryContainer,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.tertiaryFixed,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isHausa ? 'Tunatarwar Riga-kafi' : 'Immunisation Reminder',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Frosted Info Slot
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFF7F1FF),
                          height: 1.35,
                        ),
                        children: [
                          TextSpan(
                            text: isHausa
                                ? 'Yaranku $childName ta kusa ranar '
                                : 'Your child $childName is due for ',
                          ),
                          TextSpan(
                            text: vaccineName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.event_available_rounded,
                          size: 15,
                          color: AppColors.tertiaryFixed,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            '$dueDate • $scope',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.onPrimaryContainer,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Bottom Doses progression and action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Dose dots
                      for (int i = 1; i <= doseTotal; i++) ...[
                        Container(
                          width: 22,
                          height: 22,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: i < doseCurrent
                                ? AppColors.tertiaryContainer
                                : (i == doseCurrent
                                    ? AppColors.tertiaryFixed
                                    : Colors.white.withOpacity(0.2)),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$i',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: i == doseCurrent ? AppColors.primary : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(width: 6),
                      Text(
                        isHausa ? 'Dosi $doseCurrent cikin $doseTotal' : 'Dose $doseCurrent of $doseTotal',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),

                  // View Button
                  GestureDetector(
                    onTap: onViewSchedule,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isHausa ? 'Jadawali' : 'View Schedule',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 15,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
