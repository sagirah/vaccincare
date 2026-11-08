import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/models/child_profile.dart';
import '../../../core/state/app_state_notifier.dart';

class AddChildScreen extends StatefulWidget {
  final AppStateNotifier state;

  const AddChildScreen({
    super.key,
    required this.state,
  });

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController(text: '2024-01-12');
  final TextEditingController _cardNoController = TextEditingController(text: 'MCH-KN-');
  String _selectedGender = 'Female';
  String _placeOfDelivery = 'Facility';
  String _selectedPhc = 'Murtala Mohammed Specialist Hospital';

  void _onSave() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.state.isHausa ? 'Da fatan a saka sunan yaro' : 'Please enter child full name',
          ),
        ),
      );
      return;
    }

    final newChild = ChildProfile(
      id: 'child_${DateTime.now().millisecondsSinceEpoch}',
      name: _nameController.text.trim(),
      gender: _selectedGender,
      dob: _dobController.text,
      ageDisplay: 'Newborn',
      location: 'Kano State',
      hospitalCardNo: _cardNoController.text.trim(),
      nationalHealthId: 'NIG-KN-2026-${(100000 + DateTime.now().second * 31).toString()}',
      nphcdaId: 'NPHCDA #${(1000 + DateTime.now().second).toString()}',
      daysUntilNextDose: 7,
      nextDoseName: 'BCG & OPV 0 (Birth Doses)',
      nextDoseDate: 'Upcoming Schedule',
    );

    widget.state.addChild(newChild);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.state.isHausa
              ? 'An yi nasarar yin rajistar ${newChild.name}!'
              : 'Successfully enrolled ${newChild.name} into National Immunisation Registry!',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
          state.isHausa ? 'Yi Rajistar Yaro' : 'Add Child Profile',
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
            // Enrollment Progress Step
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surfaceLow,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.verified_user_rounded, color: AppColors.primary, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        state.isHausa ? 'Mataki na 1: Rajistar Yaro' : 'Step 1 of 2: Child Enrollment',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textNavy,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Photo / Birth Card Upload Box
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.surfaceContainer,
                          ),
                          child: const Icon(
                            Icons.add_a_photo_rounded,
                            size: 32,
                            color: AppColors.primary,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.photo_camera_rounded, size: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.isHausa ? 'Saka Hoton Yaro' : 'Add Child Portrait',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textNavy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      state.isHausa
                          ? 'Dauki hoton katin haihuwa na asibiti ko hoton jariri'
                          : 'Upload infant portrait or snap hospital birth card',
                      style: const TextStyle(fontSize: 11, color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Form Inputs
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surfaceLowest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name
                  Text(
                    state.isHausa ? 'Cikakken Sunan Yaro' : 'Child\'s Full Name',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.badge_outlined, color: AppColors.outline),
                      hintText: state.isHausa ? 'Misali: Aisha Sadiq Abubakar' : 'e.g., Aisha Sadiq Abubakar',
                      fillColor: AppColors.surfaceLow,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Date of birth
                  Text(
                    state.isHausa ? 'Ranar Haihuwa' : 'Date of Birth',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _dobController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_month_outlined, color: AppColors.outline),
                      hintText: 'YYYY-MM-DD',
                      fillColor: AppColors.surfaceLow,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, size: 12, color: AppColors.inStockGreen),
                      const SizedBox(width: 4),
                      Text(
                        state.isHausa
                            ? 'Ana amfani da wannan don tsara jadawalin 0-15m'
                            : 'Used to calibrate WHO/NPHCDA 0-15 month vaccine windows',
                        style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Gender
                  Text(
                    state.isHausa ? 'Jinsi' : 'Gender',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedGender = 'Female'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                              color: _selectedGender == 'Female' ? AppColors.primary : AppColors.surfaceLow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female_rounded,
                                  size: 16,
                                  color: _selectedGender == 'Female' ? Colors.white : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  state.isHausa ? 'Mace' : 'Female',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _selectedGender == 'Female' ? Colors.white : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedGender = 'Male'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                              color: _selectedGender == 'Male' ? AppColors.primary : AppColors.surfaceLow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male_rounded,
                                  size: 16,
                                  color: _selectedGender == 'Male' ? Colors.white : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  state.isHausa ? 'Namiji' : 'Male',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _selectedGender == 'Male' ? Colors.white : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Place of Delivery
                  Text(
                    state.isHausa ? 'Wurin Haihuwa' : 'Place of Delivery',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _placeOfDelivery = 'Facility'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                              color: _placeOfDelivery == 'Facility' ? AppColors.primary : AppColors.surfaceLow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_hospital_rounded,
                                  size: 16,
                                  color: _placeOfDelivery == 'Facility' ? Colors.white : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  state.isHausa ? 'Asibiti' : 'Health Facility',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _placeOfDelivery == 'Facility' ? Colors.white : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _placeOfDelivery = 'Home'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            decoration: BoxDecoration(
                              color: _placeOfDelivery == 'Home' ? AppColors.primary : AppColors.surfaceLow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  size: 16,
                                  color: _placeOfDelivery == 'Home' ? Colors.white : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  state.isHausa ? 'Gida' : 'Home',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _placeOfDelivery == 'Home' ? Colors.white : AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Hospital Card Number
                  Text(
                    state.isHausa ? 'Lambar Katin Asibiti (Na Zabi)' : 'Hospital Card Number (Optional)',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _cardNoController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.tag_rounded, color: AppColors.outline),
                      hintText: 'e.g. MCH-KN-94821',
                      fillColor: AppColors.surfaceLow,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Primary Health Center
                  Text(
                    state.isHausa ? 'Cibiyar Lafiya Mafi Kusa' : 'Primary Health Center',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.textNavy),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLow,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedPhc,
                        isExpanded: true,
                        icon: const Icon(Icons.expand_more_rounded, color: AppColors.primary),
                        items: [
                          'Murtala Mohammed Specialist Hospital',
                          'Nassarawa Comprehensive Health Centre',
                          'Fagge Maternal & Child Health Clinic',
                          'Dala Primary Health Centre',
                        ].map((phc) => DropdownMenuItem(value: phc, child: Text(phc, overflow: TextOverflow.ellipsis))).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedPhc = val);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Save & Generate Schedule Button
            ElevatedButton(
              onPressed: _onSave,
              child: Text(
                state.isHausa ? 'Ajiye Bayani & Samar da Jadawali' : 'Enroll Child & Generate Schedule',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
