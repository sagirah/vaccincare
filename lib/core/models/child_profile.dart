class ChildProfile {
  final String id;
  final String name;
  final String gender;
  final String dob;
  final String ageDisplay;
  final String location;
  final String hospitalCardNo;
  final String nationalHealthId;
  final String nphcdaId;
  final String? avatarUrl;
  final int daysUntilNextDose;
  final String nextDoseName;
  final String nextDoseDate;

  const ChildProfile({
    required this.id,
    required this.name,
    required this.gender,
    required this.dob,
    required this.ageDisplay,
    required this.location,
    required this.hospitalCardNo,
    required this.nationalHealthId,
    required this.nphcdaId,
    this.avatarUrl,
    required this.daysUntilNextDose,
    required this.nextDoseName,
    required this.nextDoseDate,
  });

  static ChildProfile defaultChild() {
    return const ChildProfile(
      id: 'child_01',
      name: 'Aisha Sadiq Abubakar',
      gender: 'Female',
      dob: '12 Jan 2024',
      ageDisplay: '2 years 4 months',
      location: 'Kano State • Nassarawa LGA',
      hospitalCardNo: 'MCH-KN-94821',
      nationalHealthId: 'NIG-KN-2024-098812',
      nphcdaId: 'NPHCDA #9482',
      daysUntilNextDose: 5,
      nextDoseName: 'Pentavalent 3',
      nextDoseDate: 'Wednesday, 28 Oct 2026',
    );
  }
}
