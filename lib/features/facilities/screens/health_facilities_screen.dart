import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/health_facility.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../appointment/screens/book_appointment_screen.dart';

class HealthFacilitiesScreen extends StatefulWidget {
  final AppStateNotifier state;

  const HealthFacilitiesScreen({
    super.key,
    required this.state,
  });

  @override
  State<HealthFacilitiesScreen> createState() => _HealthFacilitiesScreenState();
}

class _HealthFacilitiesScreenState extends State<HealthFacilitiesScreen> {
  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final facilities = state.facilities;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.isHausa ? 'Cibiyoyin Kiwon Lafiya' : 'Health Facilities',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textNavy,
              ),
            ),
            Text(
              state.isHausa ? 'Allurai & Kayan Sanyi • Jihar Kano' : 'Vaccine Stock & Cold-Chain • Kano State',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input with Mic
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: state.isHausa
                      ? 'Nemi asibiti ko yanki (misali Nassarawa, Fagge)...'
                      : 'Search by name or area (e.g. Kano, Nassarawa)...',
                  prefixIcon: const Icon(Icons.search_rounded, color: AppColors.outline),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic_none_rounded, color: AppColors.primary),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Voice search activated... Speak now in English or Hausa')),
                      );
                    },
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Hospitals', 'Clinics', 'Pharmacies', 'Cold-Chain Hubs'].map((cat) {
                  final isSel = _selectedCategory == cat;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedCategory = cat),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: isSel ? AppColors.primary : AppColors.surfaceLowest,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSel ? AppColors.primary : AppColors.surfaceContainerHigh,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isSel ? Colors.white : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Map Preview Container with stylised GPS route & pins
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFFEBE5FF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.06),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Stylized map roads & grid lines
                  CustomPaint(
                    size: const Size(double.infinity, 170),
                    painter: StylizedMapPainter(),
                  ),

                  // Selected Facility floating pill
                  Positioned(
                    top: 14,
                    left: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.local_hospital_rounded, color: AppColors.primary, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Murtala Mohammed Specialist Hospital',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '5.2 km away • Solar Cold Chain Active',
                                  style: TextStyle(fontSize: 10, color: AppColors.inStockGreen, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Pins on Map
                  const Positioned(
                    bottom: 24,
                    left: 80,
                    child: _MapPin(label: 'Giginyu PHC'),
                  ),
                  const Positioned(
                    bottom: 40,
                    right: 70,
                    child: _MapPin(label: 'Nassarawa MCH'),
                  ),
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width * 0.44,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 10),
                        ],
                      ),
                      child: const Icon(Icons.my_location_rounded, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Facilities List Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.isHausa ? 'Cibiyoyin Kusa da Kai' : 'Nearby Centers (${facilities.length})',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textNavy,
                  ),
                ),
                Text(
                  'Kano Municipal',
                  style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Facilities Cards
            ...facilities.map((facility) {
              final isInStock = facility.stockLevel == StockLevel.inStock;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textNavy,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${facility.distanceKm} km • ${facility.address}',
                                style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Stock Tag & Hours
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: isInStock ? AppColors.inStockMintBg : AppColors.warningAmberBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: isInStock ? AppColors.inStockGreen : AppColors.warningAmber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                isInStock
                                    ? (state.isHausa ? 'Akwai Allura' : 'Vaccine In Stock')
                                    : (state.isHausa ? 'Kadan Ya Rage' : 'Limited Stock'),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: isInStock ? AppColors.tertiaryContainer : AppColors.warningAmber,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          facility.openHours,
                          style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Available vaccines pills
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: facility.availableVaccines.map((v) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            v,
                            style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 12),

                    // Buttons (Call & Book)
                    Row(
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Calling ${facility.phone}...')),
                            );
                          },
                          icon: const Icon(Icons.phone_rounded, size: 15),
                          label: Text(state.isHausa ? 'Kira' : 'Call'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            side: const BorderSide(color: AppColors.surfaceContainerHigh),
                            shape: const StadiumBorder(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              state.setSelectedFacility(facility);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookAppointmentScreen(state: state),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 38),
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              state.isHausa ? 'Shirya Ziyara a Nan' : 'Book at this Clinic',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  final String label;

  const _MapPin({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.textNavy),
          ),
        ),
        const Icon(Icons.location_on_rounded, size: 18, color: AppColors.secondary),
      ],
    );
  }
}

class StylizedMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCABEFF).withOpacity(0.6)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..cubicTo(size.width * 0.3, size.height * 0.5, size.width * 0.6, size.height * 0.8, size.width, size.height * 0.3);

    canvas.drawPath(path, paint);

    final road2 = Paint()
      ..color = const Color(0xFFE5DEFF)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    final path2 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..cubicTo(size.width * 0.4, size.height * 0.5, size.width * 0.5, size.height * 0.7, size.width * 0.8, size.height);

    canvas.drawPath(path2, road2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
