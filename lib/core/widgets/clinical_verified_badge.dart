import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ClinicalVerifiedBadge extends StatelessWidget {
  final String label;
  final bool hasPulse;

  const ClinicalVerifiedBadge({
    super.key,
    this.label = 'NPHCDA Verified',
    this.hasPulse = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.inStockMintBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.tertiaryFixedDim.withOpacity(0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasPulse) ...[
            Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: AppColors.inStockGreen,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 5),
          ],
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.tertiaryContainer,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
