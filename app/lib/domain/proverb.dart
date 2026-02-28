class Proverb {
  final int id;
  final String chinese;
  final String spanish;
  final String assignedDate;

  const Proverb({
    required this.id,
    required this.chinese,
    required this.spanish,
    required this.assignedDate,
  });

  String get displayTranslation => spanish;

  factory Proverb.fromJson(Map<String, dynamic> json) {
    return Proverb(
      id: json['id'] as int,
      chinese: json['chinese'] as String,
      spanish: json['spanish'] as String? ?? '',
      assignedDate: json['assignedDate'] as String? ?? '',
    );
  }
}
