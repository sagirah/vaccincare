import 'package:flutter/material.dart';
import '../models/child_profile.dart';
import '../models/vaccine_dose.dart';
import '../models/health_facility.dart';
import '../models/health_alert.dart';
import '../models/chat_message.dart';

class AppStateNotifier extends ChangeNotifier {
  bool _isHausa = false;
  bool get isHausa => _isHausa;

  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  String _scheduleFilter = 'all';
  String get scheduleFilter => _scheduleFilter;

  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  String? _currentlyPlayingAudioId;
  String? get currentlyPlayingAudioId => _currentlyPlayingAudioId;

  late ChildProfile _activeChild;
  ChildProfile get activeChild => _activeChild;

  late List<ChildProfile> _children;
  List<ChildProfile> get children => _children;

  late List<VaccineDose> _doses;
  List<VaccineDose> get doses => _doses;

  late List<HealthFacility> _facilities;
  List<HealthFacility> get facilities => _facilities;

  late HealthFacility _selectedFacility;
  HealthFacility get selectedFacility => _selectedFacility;

  late List<HealthAlert> _alerts;
  List<HealthAlert> get alerts => _alerts;

  late List<ChatMessage> _chatMessages;
  List<ChatMessage> get chatMessages => _chatMessages;

  AppStateNotifier() {
    _activeChild = ChildProfile.defaultChild();
    _children = [
      _activeChild,
      const ChildProfile(
        id: 'child_02',
        name: 'Yusuf Sadiq Abubakar',
        gender: 'Male',
        dob: '15 Mar 2022',
        ageDisplay: '4 years 7 months',
        location: 'Kano State • Nassarawa LGA',
        hospitalCardNo: 'MCH-KN-62110',
        nationalHealthId: 'NIG-KN-2022-044199',
        nphcdaId: 'NPHCDA #4120',
        daysUntilNextDose: 45,
        nextDoseName: 'School Catch-Up Booster',
        nextDoseDate: '15 Dec 2026',
      ),
    ];
    _doses = VaccineDose.getMockSchedule();
    _facilities = HealthFacility.getKanoFacilities();
    _selectedFacility = _facilities.first;
    _alerts = HealthAlert.getKanoAlerts();
    _chatMessages = ChatMessage.getInitialMessages();
  }

  void toggleLanguage() {
    _isHausa = !_isHausa;
    notifyListeners();
  }

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  void setScheduleFilter(String filter) {
    _scheduleFilter = filter;
    notifyListeners();
  }

  void toggleNotifications(bool val) {
    _notificationsEnabled = val;
    notifyListeners();
  }

  void setSelectedFacility(HealthFacility facility) {
    _selectedFacility = facility;
    notifyListeners();
  }

  void switchActiveChild(ChildProfile child) {
    _activeChild = child;
    notifyListeners();
  }

  void addChild(ChildProfile child) {
    _children.add(child);
    _activeChild = child;
    notifyListeners();
  }

  void toggleAudioPlayback(String audioId) {
    if (_currentlyPlayingAudioId == audioId) {
      _currentlyPlayingAudioId = null;
    } else {
      _currentlyPlayingAudioId = audioId;
    }
    notifyListeners();
  }

  void sendChatMessage(String question, {String? secondary}) {
    final userMsg = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      text: question,
      secondaryTranslation: secondary,
      isUser: true,
      timestamp: 'Just now',
    );
    _chatMessages.add(userMsg);
    notifyListeners();

    // Auto-respond with medical companion advice
    Future.delayed(const Duration(milliseconds: 1000), () {
      final aiMsg = ChatMessage(
        id: 'ai_${DateTime.now().millisecondsSinceEpoch}',
        text: _isHausa
            ? 'Na karbi tambayarka kan "$question". Masanan lafiya na NPHCDA na bada shawarar bin ka\'idojin allura a kan lokaci. Tuntubi cibiyar lafiya mafi kusa idan kina bukatar karin haske.'
            : 'Thank you for your question regarding "$question". NPHCDA certified health guidelines recommend consulting your local PHC nurse or community health worker for personalized advice.',
        secondaryTranslation: _isHausa
            ? '“NPHCDA verified medical guidance confirms adherence to recommended schedules.”'
            : '“Bayanin likita da aka tabbatar daga hukumar NPHCDA.”',
        isUser: false,
        timestamp: 'Just now',
        hasAudio: true,
        isCertified: true,
      );
      _chatMessages.add(aiMsg);
      notifyListeners();
    });
  }

  List<VaccineDose> get filteredDoses {
    if (_scheduleFilter == 'completed') {
      return _doses.where((d) => d.status == VaccineStatus.completed).toList();
    } else if (_scheduleFilter == 'upcoming') {
      return _doses.where((d) => d.status == VaccineStatus.upcoming).toList();
    } else if (_scheduleFilter == 'missed') {
      return _doses.where((d) => d.status == VaccineStatus.missed).toList();
    }
    return _doses;
  }
}
