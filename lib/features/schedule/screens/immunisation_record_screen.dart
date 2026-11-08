import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/vaccine_dose.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../vaccine_details/screens/vaccine_detail_screen.dart';
import '../../certificate/screens/digital_vaccine_certificate_screen.dart';
import '../../appointment/screens/book_appointment_screen.dart';
import '../../child_management/screens/add_child_screen.dart';

class ImmunisationRecordScreen extends StatefulWidget {
  final AppStateNotifier state;

  const ImmunisationRecordScreen({
    super.key,
    required this.state,
  });

  @override
  State<ImmunisationRecordScreen> createState() => _ImmunisationRecordScreenState();
}

class _ImmunisationRecordScreenState extends State<ImmunisationRecordScreen> {
  int _selectedSegment = 0; // 0: Immunisation Record, 1: Child Details

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final child = state.activeChild;
    final filteredDoses = state.filteredDoses;

    final completedCount = state.doses.where((d) => d.status == VaccineStatus.completed).length;
    final upcomingCount = state.doses.where((d) => d.status == VaccineStatus.upcoming).length;
    final missedCount = state.doses.where((d) => d.status == VaccineStatus.missed).length;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          state.isHausa ? 'Bayanin Yaro & Jadawali' : 'Child Profile & Schedule',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textNavy,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DigitalVaccineCertificateScreen(state: state),
                  ),
                );
              },
              icon: const Icon(Icons.verified_rounded, size: 16, color: AppColors.primary),
              label: Text(
                state.isHausa ? 'Shaida' : 'Passport',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child Hero Profile Card
            Container(
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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Child Avatar
                  Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surfaceContainerHigh,
                          border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
                        ),
                        child: const Center(
                          child: Icon(Icons.child_care_rounded, size: 32, color: AppColors.primary),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: AppColors.tertiaryFixed,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.verified, size: 12, color: AppColors.tertiaryContainer),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),

                  // Metadata
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                child.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textNavy,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                child.nphcdaId,
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${child.gender} • ${child.ageDisplay}',
                          style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppColors.inStockMintBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: AppColors.inStockGreen,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    state.isHausa ? 'Kwanaki 5 ya rage' : 'Next dose in 5 days',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.tertiaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddChildScreen(state: state),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  state.isHausa ? '+ Kara Yaro' : '+ Add',
                                  style: const TextStyle(
                                    fontSize: 10,
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
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Segmented Switch: Immunisation Record vs Child Details
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSegment = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 0 ? AppColors.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: _selectedSegment == 0
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.25),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ]
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            state.isHausa ? 'Jadawalin Allura' : 'Immunisation Record',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _selectedSegment == 0 ? Colors.white : AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedSegment = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          color: _selectedSegment == 1 ? AppColors.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: _selectedSegment == 1
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.25),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ]
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            state.isHausa ? 'Bayanan Yaro' : 'Child Details',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _selectedSegment == 1 ? Colors.white : AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            if (_selectedSegment == 0) ...[
              // Filter Chips Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _filterChip(
                      label: state.isHausa ? 'Duka (7)' : 'All (7)',
                      isSelected: state.scheduleFilter == 'all',
                      onTap: () => state.setScheduleFilter('all'),
                    ),
                    const SizedBox(width: 8),
                    _filterChip(
                      label: state.isHausa ? 'An Karba ($completedCount)' : 'Completed ($completedCount)',
                      isSelected: state.scheduleFilter == 'completed',
                      dotColor: AppColors.inStockGreen,
                      onTap: () => state.setScheduleFilter('completed'),
                    ),
                    const SizedBox(width: 8),
                    _filterChip(
                      label: state.isHausa ? 'Masu Zuwa ($upcomingCount)' : 'Upcoming ($upcomingCount)',
                      isSelected: state.scheduleFilter == 'upcoming',
                      dotColor: AppColors.primary,
                      onTap: () => state.setScheduleFilter('upcoming'),
                    ),
                    const SizedBox(width: 8),
                    _filterChip(
                      label: state.isHausa ? 'Wanda Aka Wuce ($missedCount)' : 'Missed ($missedCount)',
                      isSelected: state.scheduleFilter == 'missed',
                      onTap: () => state.setScheduleFilter('missed'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Chronological Timeline with connecting spine rail
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredDoses.length,
                itemBuilder: (context, index) {
                  final dose = filteredDoses[index];
                  final isCompleted = dose.status == VaccineStatus.completed;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VaccineDetailScreen(
                            vaccine: dose,
                            state: state,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceLowest,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: dose.id == 'penta_3'
                              ? AppColors.primary.withOpacity(0.3)
                              : AppColors.borderSubtle,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Status checkmark circle
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? AppColors.tertiaryFixed
                                  : (dose.id == 'penta_3'
                                      ? AppColors.primary.withOpacity(0.12)
                                      : AppColors.surfaceContainer),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isCompleted
                                  ? Icons.check_rounded
                                  : (dose.id == 'penta_3'
                                      ? Icons.schedule_rounded
                                      : Icons.radio_button_unchecked_rounded),
                              color: isCompleted
                                  ? AppColors.tertiaryContainer
                                  : (dose.id == 'penta_3' ? AppColors.primary : AppColors.outline),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Vaccine Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        dose.name,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textNavy,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (dose.id == 'penta_3') ...[
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          state.isHausa ? 'Ranar Yau' : 'Due Now',
                                          style: const TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${dose.scheduledAge} • ${dose.diseaseScope}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                                if (isCompleted && dose.administeredDate != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    'Administered: ${dose.administeredDate} • ${dose.batchNumber ?? ''}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.inStockGreen,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Right tag / arrow
                          if (dose.id == 'penta_3')
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerHigh,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                state.isHausa ? 'Kwana 5' : 'In 5 days',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          else
                            const Icon(Icons.chevron_right, size: 18, color: AppColors.outline),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Quick Action Bar
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookAppointmentScreen(state: state),
                          ),
                        );
                      },
                      icon: const Icon(Icons.calendar_today_rounded, size: 16),
                      label: Text(
                        state.isHausa ? 'Shirya Ziyara' : 'Book Appointment',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              // Child Details Card
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    _infoRow(state.isHausa ? 'Cikakken Suna' : 'Full Legal Name', child.name),
                    const Divider(height: 24),
                    _infoRow(state.isHausa ? 'Ranar Haihuwa' : 'Date of Birth', child.dob),
                    const Divider(height: 24),
                    _infoRow(state.isHausa ? 'Jinsi' : 'Gender', child.gender),
                    const Divider(height: 24),
                    _infoRow(state.isHausa ? 'Wuri & Karamar Hukuma' : 'LGA & State', child.location),
                    const Divider(height: 24),
                    _infoRow(state.isHausa ? 'Lambar Katin Asibiti' : 'Hospital Card No.', child.hospitalCardNo),
                    const Divider(height: 24),
                    _infoRow(state.isHausa ? 'Lambar Lafiya ta Kasa' : 'National Health ID', child.nationalHealthId),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _filterChip({
    required String label,
    required bool isSelected,
    Color? dotColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceLowest,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (dotColor != null) ...[
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
        ),
      ],
    );
  }
}
