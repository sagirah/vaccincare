import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/state/app_state_notifier.dart';

class BookAppointmentScreen extends StatefulWidget {
  final AppStateNotifier state;

  const BookAppointmentScreen({
    super.key,
    required this.state,
  });

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int _selectedSlot = 0; // 0: Morning, 1: Midday, 2: Afternoon
  DateTime _selectedDate = DateTime(2026, 10, 28);
  bool _sendSmsReminder = true;

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final child = state.activeChild;
    final facility = state.selectedFacility;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textNavy),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          state.isHausa ? 'Shirya Ziyara' : 'Book Appointment',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textNavy,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Badge & Intro
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryFixed,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'PHC FAST-TRACK BOOKING',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.verified_rounded, size: 14, color: AppColors.inStockGreen),
                    const SizedBox(width: 4),
                    Text(
                      'Verified NPHCDA',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.tertiaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              state.isHausa
                  ? 'Shirya Ziyarar Allurar Yaro'
                  : 'Fast-Track PHC Booking',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
                letterSpacing: -0.3,
              ),
            ),
            Text(
              state.isHausa
                  ? 'Kare lafiyar yaranku ta hanyar samun allura ba tare da bata lokaci ba'
                  : 'Skip long outpatient queues at verified primary health centers',
              style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 16),

            // Child Selector Pill
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.surfaceContainerHigh,
                    ),
                    child: const Icon(Icons.child_care_rounded, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.isHausa ? 'YARO DA AKA ZABA' : 'SELECTED CHILD',
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: AppColors.onSurfaceVariant,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          child.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textNavy,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      child.ageDisplay,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Scheduled Vaccine Card
            Text(
              state.isHausa ? 'Allurar da Za A Yi' : 'Vaccine Scheduled',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryFixed,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.vaccines_rounded, color: AppColors.primary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pentavalent 3 & PCV 3',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textNavy,
                              ),
                            ),
                            Text(
                              'Dose 3 • Diphtheria, Pertussis, Tetanus & Pneumococcal',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.event_available_rounded, size: 15, color: AppColors.primary),
                            const SizedBox(width: 6),
                            const Text(
                              'Due: Wednesday, 28 Oct 2026',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textNavy,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            state.isHausa ? 'Kwana 5' : 'In 5 Days',
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Healthcare Facility Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.isHausa ? 'Cibiyar Kiwon Lafiya' : 'Healthcare Facility',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textNavy,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Show facility options
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
                              Text(
                                state.isHausa ? 'Zabi Cibiyar Lafiya' : 'Select Healthcare Facility',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textNavy,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...state.facilities.map((fac) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.local_hospital_rounded, color: AppColors.primary),
                                  title: Text(fac.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                                  subtitle: Text('${fac.distanceKm} km • ${fac.lga}'),
                                  trailing: fac.id == facility.id
                                      ? const Icon(Icons.check_circle, color: AppColors.primary)
                                      : null,
                                  onTap: () {
                                    state.setSelectedFacility(fac);
                                    Navigator.pop(ctx);
                                  },
                                );
                              }),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    state.isHausa ? 'Canza' : 'Change',
                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.local_hospital_rounded, color: AppColors.primary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              facility.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textNavy,
                              ),
                            ),
                            Text(
                              '${facility.lga} • ${facility.distanceKm} km away',
                              style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.inStockMintBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.severe_cold_rounded, size: 16, color: AppColors.inStockGreen),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            state.isHausa
                                ? 'Ingantaccen Adana: Alluran na cikin firinji mai amfani da hasken rana'
                                : 'Cold Chain Certified: Solar Direct Drive active (2°C - 8°C)',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.tertiaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Time Slot Selection
            Text(
              state.isHausa ? 'Lokacin Zuwa' : 'Select Time Slot',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _slotTile(0, 'Morning / Safe', '8:00 AM - 11:30 AM'),
                const SizedBox(width: 8),
                _slotTile(1, 'Midday / Rana', '12:00 PM - 2:30 PM'),
                const SizedBox(width: 8),
                _slotTile(2, 'Afternoon / Yamma', '3:00 PM - 5:30 PM'),
              ],
            ),

            const SizedBox(height: 16),

            // SMS Alert Confirmation
            Row(
              children: [
                Checkbox(
                  value: _sendSmsReminder,
                  activeColor: AppColors.primary,
                  onChanged: (val) => setState(() => _sendSmsReminder = val ?? true),
                ),
                Expanded(
                  child: Text(
                    state.isHausa
                        ? 'Aiko da sakon SMS na kyauta kwana 1 kafin ziyara'
                        : 'Send free SMS confirmation & 24h reminder to +234 803 123 4567',
                    style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    title: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded, color: AppColors.inStockGreen),
                        const SizedBox(width: 8),
                        Text(state.isHausa ? 'An Tabbatar!' : 'Appointment Confirmed!'),
                      ],
                    ),
                    content: Text(
                      state.isHausa
                          ? 'An shirya ziyarar Aisha a ranar Laraba 28 ga Oktoba a Asibitin Murtala Mohammed. An tura lambar tabbatarwa zuwa wayarku.'
                          : 'Aisha\'s appointment for Pentavalent 3 at ${facility.name} on 28 Oct 2026 is confirmed. A reference SMS was dispatched to your mobile.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          Navigator.pop(context);
                        },
                        child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                state.isHausa ? 'Tabbatar da Ziyara' : 'Confirm PHC Fast-Track Booking',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _slotTile(int index, String label, String time) {
    final isSelected = _selectedSlot == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedSlot = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceLowest,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : AppColors.textNavy,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: TextStyle(
                  fontSize: 9,
                  color: isSelected ? Colors.white.withOpacity(0.85) : AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
