import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/vaccine_dose.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../appointment/screens/book_appointment_screen.dart';

class VaccineDetailScreen extends StatefulWidget {
  final VaccineDose vaccine;
  final AppStateNotifier state;

  const VaccineDetailScreen({
    super.key,
    required this.vaccine,
    required this.state,
  });

  @override
  State<VaccineDetailScreen> createState() => _VaccineDetailScreenState();
}

class _VaccineDetailScreenState extends State<VaccineDetailScreen> {
  int _activeTab = 0; // 0: Overview, 1: Schedule, 2: Side Effects
  bool _isPlayingAudio = false;

  @override
  Widget build(BuildContext context) {
    final v = widget.vaccine;
    final state = widget.state;

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
          state.isHausa ? 'Cikakken Bayanin Allura' : 'Vaccine Dose Details',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textNavy,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Vaccine Summary Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.05),
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: AppColors.borderSubtle),
              ),
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.vaccines_rounded,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.tertiaryFixed.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                state.isHausa ? 'Allurar Wajibi ta Kasa' : 'Essential NPI Schedule',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.tertiaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              v.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textNavy,
                                letterSpacing: -0.3,
                              ),
                            ),
                            Text(
                              '(${v.diseaseScope})',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    v.purpose,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Target Disease Chips
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: v.targetDiseases.map((dis) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          dis,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSecondaryContainer,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Segmented Tabs: Overview, Schedule, Side Effects
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _tabItem(0, state.isHausa ? 'Bayanai' : 'Overview'),
                  _tabItem(1, state.isHausa ? 'Jadawali' : 'Schedule'),
                  _tabItem(2, state.isHausa ? 'Alamomi' : 'Side Effects'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Hausa Voice Audio Assist Card
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.surfaceContainerHigh, AppColors.surfaceContainer],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlayingAudio = !_isPlayingAudio;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _isPlayingAudio
                                ? (state.isHausa
                                    ? 'Ana sauraron bayani a harshen Hausa...'
                                    : 'Playing Pentavalent guide in Hausa audio...')
                                : 'Audio paused.',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        _isPlayingAudio ? Icons.pause_rounded : Icons.volume_up_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.translate, size: 12, color: AppColors.primary),
                            const SizedBox(width: 4),
                            Text(
                              state.isHausa ? 'SAURARI DA HAUSA' : 'LISTEN IN HAUSA',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          state.isHausa ? 'Bayani a Harshen Hausa' : 'Audio Guide in Hausa',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textNavy,
                          ),
                        ),
                        Text(
                          '${v.audioGuideDuration} • Voice audio assist',
                          style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLowest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Bilingual',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tab Content
            if (_activeTab == 0) ...[
              _bentoCard(
                icon: Icons.shield_rounded,
                iconColor: AppColors.primary,
                title: state.isHausa ? 'Dalilin Allurar' : 'Primary Purpose',
                content:
                    'Prevents 5 life-threatening bacterial infections and liver complications in early infancy. Builds maternal and herd immunity in communities.',
              ),
              const SizedBox(height: 10),
              _bentoCard(
                icon: Icons.schedule_rounded,
                iconColor: AppColors.secondary,
                title: state.isHausa ? 'Ranar da Aka Shawarta' : 'Recommended Timing',
                content:
                    'Administered precisely at 6 weeks (Dose 1), 10 weeks (Dose 2), and 14 weeks (Dose 3) after birth.',
              ),
            ] else if (_activeTab == 1) ...[
              _bentoCard(
                icon: Icons.timeline_rounded,
                iconColor: AppColors.inStockGreen,
                title: state.isHausa ? 'Jadawalin Allurai' : 'Administration Schedule',
                content:
                    '• Dose 1: 6 Weeks after birth\n• Dose 2: 10 Weeks after birth\n• Dose 3: 14 Weeks (Crucial final primary dose)',
              ),
              const SizedBox(height: 10),
              _bentoCard(
                icon: Icons.local_hospital_rounded,
                iconColor: AppColors.primary,
                title: state.isHausa ? 'Hanyar Bayarwa' : 'Route & Administration',
                content:
                    'Intramuscular injection into the anterolateral aspect of the upper thigh by a certified nurse or community health worker.',
              ),
            ] else ...[
              _bentoCard(
                icon: Icons.thermostat_rounded,
                iconColor: AppColors.warningAmber,
                title: state.isHausa ? 'Alamomin Da Za A Iya Gani' : 'Expected Reactions',
                content: v.sideEffects,
              ),
              const SizedBox(height: 10),
              _bentoCard(
                icon: Icons.info_outline_rounded,
                iconColor: AppColors.inStockGreen,
                title: state.isHausa ? 'Shawarar Kula da Yaro' : 'Home Care Advice',
                content:
                    'Apply a clean, cool damp cloth to the injection site. Continue frequent breastfeeding. Do not massage or press hard on the thigh.',
              ),
            ],

            const SizedBox(height: 24),

            // Bottom CTA
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentScreen(state: state),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.event_available_rounded, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    state.isHausa ? 'Shirya Ziyara don Wannan Allura' : 'Book Vaccine Appointment',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(int index, String label) {
    final isSelected = _activeTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            boxShadow: isSelected
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
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bentoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLowest,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textNavy,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
