enum StockLevel { inStock, limitedStock, outOfStock }

class HealthFacility {
  final String id;
  final String name;
  final String type;
  final String lga;
  final String address;
  final double distanceKm;
  final String openHours;
  final StockLevel stockLevel;
  final bool hasSolarColdChain;
  final String phone;
  final List<String> availableVaccines;
  final bool isVerifiedNphcda;

  const HealthFacility({
    required this.id,
    required this.name,
    required this.type,
    required this.lga,
    required this.address,
    required this.distanceKm,
    required this.openHours,
    required this.stockLevel,
    this.hasSolarColdChain = true,
    required this.phone,
    required this.availableVaccines,
    this.isVerifiedNphcda = true,
  });

  static List<HealthFacility> getKanoFacilities() {
    return const [
      HealthFacility(
        id: 'fac_01',
        name: 'Murtala Mohammed Specialist Hospital',
        type: 'State Specialist Hospital',
        lga: 'Kano Municipal',
        address: 'Kofar Nassarawa Road, Kano City',
        distanceKm: 5.2,
        openHours: 'Open 8:00am – 6:00pm (Daily)',
        stockLevel: StockLevel.inStock,
        phone: '+234 64 632 091',
        availableVaccines: ['Pentavalent', 'OPV', 'BCG', 'PCV', 'Rotavirus', 'Measles'],
      ),
      HealthFacility(
        id: 'fac_02',
        name: 'Nassarawa Comprehensive Health Centre',
        type: 'Primary Health Care Centre',
        lga: 'Nassarawa LGA',
        address: 'Giginyu Quarters, Near Post Office',
        distanceKm: 2.1,
        openHours: 'Open 8:00am – 4:00pm (Mon - Sat)',
        stockLevel: StockLevel.inStock,
        phone: '+234 803 555 1204',
        availableVaccines: ['Pentavalent', 'OPV', 'BCG', 'Yellow Fever', 'Vitamin A'],
      ),
      HealthFacility(
        id: 'fac_03',
        name: 'Fagge Maternal & Child Health Clinic',
        type: 'MCH Center',
        lga: 'Fagge LGA',
        address: 'Fagge D2, Mission Road, Kano',
        distanceKm: 6.8,
        openHours: 'Open 8:30am – 3:30pm (Mon - Fri)',
        stockLevel: StockLevel.limitedStock,
        phone: '+234 812 400 9988',
        availableVaccines: ['Pentavalent (12 doses left)', 'OPV', 'BCG'],
      ),
      HealthFacility(
        id: 'fac_04',
        name: 'Dala Primary Health Centre',
        type: 'Primary Health Care Centre',
        lga: 'Dala LGA',
        address: 'Dala Hill Road, Dala, Kano',
        distanceKm: 8.4,
        openHours: 'Open 8:00am – 4:00pm (Daily)',
        stockLevel: StockLevel.inStock,
        phone: '+234 802 331 4455',
        availableVaccines: ['Pentavalent', 'OPV', 'PCV', 'Measles', 'COVID-19'],
      ),
    ];
  }
}
