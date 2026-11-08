enum VaccineStatus { completed, upcoming, missed }

class VaccineDose {
  final String id;
  final String name;
  final String diseaseScope;
  final String scheduledAge;
  final int doseNumber;
  final int totalDoses;
  final VaccineStatus status;
  final String? administeredDate;
  final String? dueDate;
  final String? batchNumber;
  final String? facility;
  final List<String> targetDiseases;
  final String purpose;
  final String sideEffects;
  final String audioGuideDuration;

  const VaccineDose({
    required this.id,
    required this.name,
    required this.diseaseScope,
    required this.scheduledAge,
    required this.doseNumber,
    required this.totalDoses,
    required this.status,
    this.administeredDate,
    this.dueDate,
    this.batchNumber,
    this.facility,
    required this.targetDiseases,
    required this.purpose,
    required this.sideEffects,
    this.audioGuideDuration = '0:48 mins',
  });

  static List<VaccineDose> getMockSchedule() {
    return const [
      VaccineDose(
        id: 'bcg',
        name: 'BCG (Bacillus Calmette-Guérin)',
        diseaseScope: 'Tuberculosis',
        scheduledAge: 'At Birth',
        doseNumber: 1,
        totalDoses: 1,
        status: VaccineStatus.completed,
        administeredDate: '12 Jan 2024',
        batchNumber: 'BCG-2024-NIG091',
        facility: 'Murtala Mohammed Specialist Hospital, Kano',
        targetDiseases: ['Tuberculosis'],
        purpose: 'Protects infants against severe tuberculosis and TB meningitis.',
        sideEffects: 'Small red bump that may form a tiny scar over 6-10 weeks.',
      ),
      VaccineDose(
        id: 'opv_0',
        name: 'OPV 0 (Oral Polio Vaccine)',
        diseaseScope: 'Poliomyelitis',
        scheduledAge: 'At Birth',
        doseNumber: 0,
        totalDoses: 4,
        status: VaccineStatus.completed,
        administeredDate: '12 Jan 2024',
        batchNumber: 'OPV-NPHCDA-882',
        facility: 'Murtala Mohammed Specialist Hospital, Kano',
        targetDiseases: ['Poliovirus Types 1 & 3'],
        purpose: 'Provides vital mucosal immunity in the gut against poliovirus paralysis.',
        sideEffects: 'Extremely mild; rarely causes loose stool.',
      ),
      VaccineDose(
        id: 'hepb_0',
        name: 'Hepatitis B 0 (Birth Dose)',
        diseaseScope: 'Hepatitis B Virus',
        scheduledAge: 'Within 24 Hours',
        doseNumber: 1,
        totalDoses: 4,
        status: VaccineStatus.completed,
        administeredDate: '12 Jan 2024',
        batchNumber: 'HEP-B-24-771',
        facility: 'Murtala Mohammed Specialist Hospital, Kano',
        targetDiseases: ['Hepatitis B'],
        purpose: 'Prevents vertical mother-to-child transmission of chronic Hepatitis B.',
        sideEffects: 'Mild soreness at the injection site.',
      ),
      VaccineDose(
        id: 'penta_1',
        name: 'Pentavalent 1',
        diseaseScope: 'DTP - HepB - Hib',
        scheduledAge: '6 Weeks',
        doseNumber: 1,
        totalDoses: 3,
        status: VaccineStatus.completed,
        administeredDate: '24 Feb 2024',
        batchNumber: 'PEN-82019-B',
        facility: 'Nassarawa Primary Health Centre',
        targetDiseases: ['Diphtheria', 'Pertussis', 'Tetanus', 'Hep B', 'Hib'],
        purpose: 'First combination protection against 5 life-threatening bacterial infections.',
        sideEffects: 'Low-grade fever and mild irritability.',
      ),
      VaccineDose(
        id: 'penta_2',
        name: 'Pentavalent 2',
        diseaseScope: 'DTP - HepB - Hib',
        scheduledAge: '10 Weeks',
        doseNumber: 2,
        totalDoses: 3,
        status: VaccineStatus.completed,
        administeredDate: '24 Mar 2024',
        batchNumber: 'PEN-82090-K',
        facility: 'Nassarawa Primary Health Centre',
        targetDiseases: ['Diphtheria', 'Pertussis', 'Tetanus', 'Hep B', 'Hib'],
        purpose: 'Second combination dose reinforcing antibody titers.',
        sideEffects: 'Mild swelling at injection site; temporary fussiness.',
      ),
      VaccineDose(
        id: 'penta_3',
        name: 'Pentavalent 3',
        diseaseScope: 'DTP - HepB - Hib',
        scheduledAge: '14 Weeks / Due Now',
        doseNumber: 3,
        totalDoses: 3,
        status: VaccineStatus.upcoming,
        dueDate: 'Wednesday, 28 Oct 2026',
        targetDiseases: [
          'Diphtheria',
          'Pertussis (Whooping cough)',
          'Tetanus',
          'Hepatitis B',
          'Haemophilus influenzae type b'
        ],
        purpose: 'Crucial completion dose for lifelong protection against five deadly childhood illnesses.',
        sideEffects: 'Mild fever within 24-48 hours, transient redness. Paracetamol drops recommended if advised by nurse.',
      ),
      VaccineDose(
        id: 'measles_1',
        name: 'Measles 1 (MCV1) & Yellow Fever',
        diseaseScope: 'Measles Virus & Flavivirus',
        scheduledAge: '9 Months',
        doseNumber: 1,
        totalDoses: 2,
        status: VaccineStatus.upcoming,
        dueDate: '14 Nov 2026',
        targetDiseases: ['Measles', 'Yellow Fever'],
        purpose: 'Protection against epidemic measles blindness/pneumonia and endemic yellow fever.',
        sideEffects: 'Mild rash or fever 5-12 days after dose.',
      ),
    ];
  }
}
