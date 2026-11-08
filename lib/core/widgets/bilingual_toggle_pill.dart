import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BilingualTogglePill extends StatelessWidget {
  final bool isHausa;
  final VoidCallback onToggle;

  const BilingualTogglePill({
    super.key,
    required this.isHausa,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.translate,
              size: 15,
              color: AppColors.primary,
            ),
            const SizedBox(width: 5),
            Text(
              isHausa ? 'HAU / ENG' : 'ENG / HAU',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
