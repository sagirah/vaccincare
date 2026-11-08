class HealthAlert {
  final String id;
  final String title;
  final String titleHausa;
  final String advisoryType;
  final String date;
  final String region;
  final String description;
  final String descriptionHausa;
  final bool isUrgent;
  final bool hasAudioHausa;
  final String highlightText;
  final String ctaText;

  const HealthAlert({
    required this.id,
    required this.title,
    required this.titleHausa,
    required this.advisoryType,
    required this.date,
    required this.region,
    required this.description,
    required this.descriptionHausa,
    this.isUrgent = false,
    this.hasAudioHausa = true,
    required this.highlightText,
    required this.ctaText,
  });

  static List<HealthAlert> getKanoAlerts() {
    return const [
      HealthAlert(
        id: 'measles_alert',
        title: 'Measles Outbreak Vigilance',
        titleHausa: 'Gargadi kan Cutar Kyanda • Jihar Kano',
        advisoryType: 'Public Health Advisory',
        date: '12 Oct 2026',
        region: 'Kano Municipal, Fagge & Nassarawa LGAs',
        description:
            'Increased cases reported in Kano Municipal, Fagge & Nassarawa LGAs. Ensure your child is fully immunized with Measles Dose 1 & 2. Primary healthcare centers are dispensing free supplementary doses this week.',
        descriptionHausa:
            'An samu karuwar masu fama da kyanda a kananan hukumomin Kano Municipal, Fagge da Nassarawa. Tabbatar yaranku sun karbi rigakafin kyanda dosi na 1 da na 2. Ana samun allurar kyauta a cibiyoyin lafiya.',
        isUrgent: true,
        hasAudioHausa: true,
        highlightText: 'Free Vaccines at Murtala Mohammed Specialist Hospital',
        ctaText: 'Learn More',
      ),
      HealthAlert(
        id: 'polio_drive',
        title: 'Seasonal Immunisation Campaign (OPV + Vit A)',
        titleHausa: 'Yakin Neman Rigakafin Shan Inna da Bitamin A',
        advisoryType: 'National Drive',
        date: '1 Nov – 30 Nov 2026',
        region: 'Pan-State Wide • Kano State',
        description:
            'Door-to-door community health volunteers (CHVs) and ward health posts will administer free oral polio droplets along with Vitamin A supplementation for all children aged 0–59 months.',
        descriptionHausa:
            'Masu aikin sa-kai za su bi gida-gida da dakunan shan magani domin ba da digon rigakafin shan inna da kwayoyin Bitamin A ga dukkan yara masu watanni 0 zuwa 59 kyauta.',
        isUrgent: false,
        hasAudioHausa: true,
        highlightText: 'Eligible: Children under 5 yrs',
        ctaText: 'Find CHV Station',
      ),
    ];
  }
}
