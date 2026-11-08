/// Bilingual (English & Hausa) strings for VacciCare
class AppStrings {
  // Common
  static String appName = 'VacciCare';
  static String tagline(bool isHausa) => isHausa
      ? 'Kowace Allura, a Kan Kari!'
      : '“Every Vaccine, Right on Time!”';

  // Greeting
  static String greetingSub(bool isHausa) =>
      isHausa ? 'Ina kwana, sannu da safe' : 'Good Morning, Caregiver';
  static String greetingTitle(bool isHausa, String name) =>
      isHausa ? 'Barka da Safiya, $name' : 'Good Morning, $name';

  // Bottom Navigation
  static String navHome(bool isHausa) => isHausa ? 'Gida' : 'Home';
  static String navSchedule(bool isHausa) => isHausa ? 'Jadawali' : 'Schedule';
  static String navFacilities(bool isHausa) => isHausa ? 'Cibiyoyi' : 'Facilities';
  static String navAlerts(bool isHausa) => isHausa ? 'Sanarwa' : 'Alerts';
  static String navMore(bool isHausa) => isHausa ? 'Karin Bayani' : 'More';

  // Child Profile & Status
  static String nextVaccineInDays(bool isHausa, int days) => isHausa
      ? 'Allura ta gaba a cikin kwanaki $days'
      : 'Next vaccine in $days days';
  static String criticalSchedule(bool isHausa) =>
      isHausa ? 'JADAWALIN GAGGAWA' : 'CRITICAL SCHEDULE';
  static String immunisationReminder(bool isHausa) =>
      isHausa ? 'Tunatarwar Riga-kafi' : 'Immunisation Reminder';
  static String viewSchedule(bool isHausa) =>
      isHausa ? 'Duba Jadawali' : 'View Schedule';
  static String viewFullProfile(bool isHausa) =>
      isHausa ? 'Duba Cikakken Bayani' : 'View Full Profile';

  // Quick Action Grid
  static String vaccinesAndInfo(bool isHausa) =>
      isHausa ? 'Allurai & Bayani' : 'Vaccines & Info';
  static String guideAndDoses(bool isHausa) =>
      isHausa ? 'Jagora & Dosi' : 'Guide & Doses';
  static String findFacilities(bool isHausa) =>
      isHausa ? 'Nemi Asibiti' : 'Find Facilities';
  static String stockVerified(bool isHausa) =>
      isHausa ? 'Akwai Allura' : 'Stock Verified';
  static String alertsAndNews(bool isHausa) =>
      isHausa ? 'Sanarwa & Labarai' : 'Alerts & News';
  static String kanoRegion(bool isHausa) =>
      isHausa ? 'Yankin Kano' : 'Kano Region';

  // AI Assistant
  static String aiTitle(bool isHausa) =>
      isHausa ? 'Mataimakin VacciCare' : 'VacciCare Assistant';
  static String aiSubtitle(bool isHausa) => isHausa
      ? 'Tambayi likita kan zazzabi ko allurar riga-kafi'
      : 'Ask doctor about fever or vaccine side effects';
  static String askAi(bool isHausa) => isHausa ? 'Tambaya' : 'Ask AI';

  // Digital Certificate
  static String certTitle(bool isHausa) =>
      isHausa ? 'Shaidar Rigakafi ta Dijital' : 'Digital Vaccine Certificate';
  static String certSub(bool isHausa) => isHausa
      ? 'Fasfo din Lafiya da Shaidar Allura'
      : 'Digital Health Passport & Vaccine Pass';
  static String healthIdLabel(bool isHausa) =>
      isHausa ? 'Lambar Lafiya ta Kasa' : 'National Health ID';

  // Appointments
  static String bookAppointment(bool isHausa) =>
      isHausa ? 'Shirya Ziyara' : 'Book Appointment';
  static String bookSub(bool isHausa) => isHausa
      ? 'Shirya ziyarar riga-kafi don kare lafiyar yaranku'
      : 'Fast-track PHC appointment to protect your child';

  // Facilities
  static String facilitiesTitle(bool isHausa) =>
      isHausa ? 'Cibiyoyin Kiwon Lafiya' : 'Health Facilities';
  static String inStock(bool isHausa) =>
      isHausa ? 'Akwai a Kasa' : 'Vaccine In Stock';
  static String limitedStock(bool isHausa) =>
      isHausa ? 'Kadan Ya Rage' : 'Limited Stock';
}
