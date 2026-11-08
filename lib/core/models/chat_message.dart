class ChatMessage {
  final String id;
  final String text;
  final String? secondaryTranslation;
  final bool isUser;
  final String timestamp;
  final bool hasAudio;
  final bool isCertified;

  const ChatMessage({
    required this.id,
    required this.text,
    this.secondaryTranslation,
    required this.isUser,
    required this.timestamp,
    this.hasAudio = false,
    this.isCertified = false,
  });

  static List<ChatMessage> getInitialMessages() {
    return const [
      ChatMessage(
        id: 'msg_01',
        text:
            'Yata Aisha ta karbi rigakafin Pentavalent 3 jiya, yau tana da dan zazzabi da kuka. Shin hakan lafiya ne?',
        secondaryTranslation:
            '“Yesterday my daughter received Pentavalent 3, today she has slight fever and crying. Is this normal?”',
        isUser: true,
        timestamp: '10:14 AM',
      ),
      ChatMessage(
        id: 'msg_02',
        text:
            'Sannu Fatima! Hakan abu ne na yau da kullum. Zazzabi kadan da damuwa bayan rigakafin Pentavalent 3 alama ce da ke nuna cewa garkuwar jikinta na aiki don kare ta daga cututtuka 5.\n\nAbin da zaki iya yi:\n1. Tsaftace wurin da aka yi allurar da kyalle mai ruwan dumi.\n2. Bada ruwan nono akai-akai don hana bushewar ruwa.\n3. Idan zazzabin ya haura kwanaki biyu, ziyarci Cibiyar Lafiya ta Murtala Mohammed mafi kusa.',
        secondaryTranslation:
            '“Hello Fatima! Mild fever and fussiness are normal reactions indicating Aisha’s immune system is actively building protective antibodies. Keep her hydrated and apply a cool, damp cloth to the injection site. If fever persists over 48 hours, consult Murtala Mohammed Hospital.”',
        isUser: false,
        timestamp: '10:15 AM',
        hasAudio: true,
        isCertified: true,
      ),
    ];
  }
}
