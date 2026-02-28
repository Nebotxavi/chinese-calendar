import 'package:feng_shui_calendar/domain/proverb.dart';

class CalendarDay {
  final DateTime date;
  final int year;
  final int month;
  final int day;
  final String weekdayEs;
  final String weekdayZh;
  final String lunarDateDisplay;
  final String yearGanZhi;
  final String dayGanZhi;
  final String elementZh;
  final String elementEs;
  final String solarTermZh;
  final String solarTermEs;
  final int solarTermDayCount;
  final List<String> auspiciousZh;
  final List<String> auspiciousEs;
  final List<String> inauspiciousZh;
  final List<String> inauspiciousEs;
  final Proverb proverb;

  const CalendarDay({
    required this.date,
    required this.year,
    required this.month,
    required this.day,
    required this.weekdayEs,
    required this.weekdayZh,
    required this.lunarDateDisplay,
    required this.yearGanZhi,
    required this.dayGanZhi,
    required this.elementZh,
    required this.elementEs,
    required this.solarTermZh,
    required this.solarTermEs,
    required this.solarTermDayCount,
    required this.auspiciousZh,
    required this.auspiciousEs,
    required this.inauspiciousZh,
    required this.inauspiciousEs,
    required this.proverb,
  });

  bool get hasSolarTerm => solarTermZh.isNotEmpty;

  String get monthLabelEs => _monthAbbreviationsEs[month] ?? '';

  static const _monthAbbreviationsEs = {
    1: 'ENE',
    2: 'FEB',
    3: 'MAR',
    4: 'ABR',
    5: 'MAY',
    6: 'JUN',
    7: 'JUL',
    8: 'AGO',
    9: 'SEP',
    10: 'OCT',
    11: 'NOV',
    12: 'DIC',
  };
}
