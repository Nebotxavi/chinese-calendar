class Proverb {
  final int id;
  final String chinese;
  final String pinyin;
  final String english;
  final String spanish;
  final String source;
  final String sourceWork;
  final String author;
  final String category;
  final List<String> tags;
  final String? solarTerm;

  const Proverb({
    required this.id,
    required this.chinese,
    required this.pinyin,
    required this.english,
    required this.spanish,
    required this.source,
    required this.sourceWork,
    required this.author,
    required this.category,
    required this.tags,
    this.solarTerm,
  });

  String get displayTranslation =>
      spanish.isNotEmpty ? spanish : english;

  factory Proverb.fromJson(Map<String, dynamic> json) {
    return Proverb(
      id: json['id'] as int,
      chinese: json['chinese'] as String,
      pinyin: json['pinyin'] as String? ?? '',
      english: json['english'] as String? ?? '',
      spanish: json['spanish'] as String? ?? '',
      source: json['source'] as String? ?? '',
      sourceWork: json['sourceWork'] as String? ?? '',
      author: json['author'] as String? ?? '',
      category: json['category'] as String? ?? '',
      tags: List<String>.from(json['tags'] as List? ?? []),
      solarTerm: json['solarTerm'] as String?,
    );
  }
}
