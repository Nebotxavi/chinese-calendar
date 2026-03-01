import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';
import 'package:feng_shui_calendar/data/datasources/lunar_data_source.dart';

/// Exploration test to dump all lunar package data for comparison
/// with other Huangli apps. Run with:
///   flutter test test/lunar_explore_test.dart
void main() {
  late LunarDataSource dataSource;

  setUp(() {
    dataSource = LunarDataSource();
  });

  test('FULL dump for March 1, 2026 (today)', () {
    _dumpFullDay(2026, 3, 1, dataSource);
  });

  test('FULL dump for March 2, 2026', () {
    _dumpFullDay(2026, 3, 2, dataSource);
  });

  test('FULL dump for March 15, 2026', () {
    _dumpFullDay(2026, 3, 15, dataSource);
  });

  test('compare Yi/Ji across first week of March 2026', () {
    // ignore: avoid_print
    print('\n${"=" * 70}');
    // ignore: avoid_print
    print('YI/JI COMPARISON — March 1-7, 2026');
    // ignore: avoid_print
    print('${"=" * 70}');

    for (var day = 1; day <= 7; day++) {
      final solar = Solar.fromYmd(2026, 3, day);
      final lunar = solar.getLunar();

      // ignore: avoid_print
      print('\nMarch $day (${lunar.getDayInGanZhi()}) — '
          'Lunar: ${lunar.getMonthInChinese()}月${lunar.getDayInChinese()}');
      // ignore: avoid_print
      print('  宜 Yi: ${lunar.getDayYi().join(", ")}');
      // ignore: avoid_print
      print('  忌 Ji: ${lunar.getDayJi().join(", ")}');
    }
  });

  test('explore additional lunar methods (deities, Peng Zu, clashes)', () {
    final solar = Solar.fromYmd(2026, 3, 1);
    final lunar = solar.getLunar();
    final eightChar = lunar.getEightChar();

    // ignore: avoid_print
    print('\n${"=" * 70}');
    // ignore: avoid_print
    print('DEEP DIVE — March 1, 2026');
    // ignore: avoid_print
    print('${"=" * 70}');

    // Eight Characters (BaZi)
    // ignore: avoid_print
    print('\n--- Eight Characters (八字) ---');
    // ignore: avoid_print
    print('Year pillar: ${eightChar.getYear()}');
    // ignore: avoid_print
    print('Month pillar: ${eightChar.getMonth()}');
    // ignore: avoid_print
    print('Day pillar: ${eightChar.getDay()}');
    // ignore: avoid_print
    print('Hour pillar (noon): ${eightChar.getTime()}');

    // Nayin (Five Elements for each pillar)
    // ignore: avoid_print
    print('\n--- Nayin (纳音) ---');
    // ignore: avoid_print
    print('Year nayin: ${eightChar.getYearNaYin()}');
    // ignore: avoid_print
    print('Month nayin: ${eightChar.getMonthNaYin()}');
    // ignore: avoid_print
    print('Day nayin: ${eightChar.getDayNaYin()}');

    // Wu Xing (Five Elements)
    // ignore: avoid_print
    print('\n--- Wu Xing (五行) ---');
    // ignore: avoid_print
    print('Year wuxing: ${eightChar.getYearWuXing()}');
    // ignore: avoid_print
    print('Month wuxing: ${eightChar.getMonthWuXing()}');
    // ignore: avoid_print
    print('Day wuxing: ${eightChar.getDayWuXing()}');

    // Peng Zu taboos
    // ignore: avoid_print
    print('\n--- Peng Zu Taboos (彭祖百忌) ---');
    // ignore: avoid_print
    print('Peng Zu Tian Gan: ${lunar.getPengZuGan()}');
    // ignore: avoid_print
    print('Peng Zu Di Zhi: ${lunar.getPengZuZhi()}');

    // Day Officer (twelve day cycle)
    // ignore: avoid_print
    print('\n--- Day Officer (建除十二值) ---');
    // ignore: avoid_print
    print('Zhi (值): ${lunar.getZhiXing()}');

    // Clash
    // ignore: avoid_print
    print('\n--- Clash & Sha (冲煞) ---');
    // ignore: avoid_print
    print('Day chong: ${lunar.getDayChong()}');
    // ignore: avoid_print
    print('Day chong desc: ${lunar.getDayChongDesc()}');
    // ignore: avoid_print
    print('Day sha: ${lunar.getDaySha()}');
    // ignore: avoid_print
    print('Day chong sheng xiao: ${lunar.getDayChongShengXiao()}');

    // Lucky/Unlucky deities
    // ignore: avoid_print
    print('\n--- Lucky/Unlucky hours ---');
    // ignore: avoid_print
    print('Time Yi (hours): ${lunar.getTimeYi().join(", ")}');
    // ignore: avoid_print
    print('Time Ji (hours): ${lunar.getTimeJi().join(", ")}');

    // Auspicious gods
    // ignore: avoid_print
    print('\n--- Auspicious Deities (吉神宜趋) ---');
    // ignore: avoid_print
    print('Day Ji Shen: ${lunar.getDayJiShen().join(", ")}');

    // Inauspicious gods
    // ignore: avoid_print
    print('\n--- Inauspicious Spirits (凶煞宜忌) ---');
    // ignore: avoid_print
    print('Day Xiong Sha: ${lunar.getDayXiongSha().join(", ")}');

    // Stars
    // ignore: avoid_print
    print('\n--- 28 Mansions (二十八宿) ---');
    // ignore: avoid_print
    print('Xiu: ${lunar.getXiu()}');
    // ignore: avoid_print
    print('Xiu luck: ${lunar.getXiuLuck()}');
    // ignore: avoid_print
    print('Xiu song: ${lunar.getXiuSong()}');

    // Misc
    // ignore: avoid_print
    print('\n--- Miscellaneous ---');
    // ignore: avoid_print
    print('Lunar month GanZhi: ${lunar.getMonthInGanZhi()}');
    // ignore: avoid_print
    print('Year in GanZhi: ${lunar.getYearInGanZhi()}');
    // ignore: avoid_print
    print('Day in GanZhi: ${lunar.getDayInGanZhi()}');
    // ignore: avoid_print
    print('Year Sheng Xiao: ${lunar.getYearShengXiao()}');
    // ignore: avoid_print
    print('Month Sheng Xiao: ${lunar.getMonthShengXiao()}');
    // ignore: avoid_print
    print('Day Sheng Xiao: ${lunar.getDayShengXiao()}');
  });

  test('month Yi/Ji listing (March 2026)', () {
    // ignore: avoid_print
    print('\n${"=" * 70}');
    // ignore: avoid_print
    print('MONTH OVERVIEW — March 2026');
    // ignore: avoid_print
    print('${"=" * 70}');

    for (var day = 1; day <= 31; day++) {
      final solar = Solar.fromYmd(2026, 3, day);
      final lunar = solar.getLunar();
      final yiCount = lunar.getDayYi().length;
      final jiCount = lunar.getDayJi().length;

      // ignore: avoid_print
      print('Mar ${'$day'.padLeft(2)} | '
          '${lunar.getDayInGanZhi()} | '
          'Yi: ${'$yiCount'.padLeft(2)} items | '
          'Ji: ${'$jiCount'.padLeft(2)} items | '
          '${lunar.getZhiXing()}');
    }
  });
}

void _dumpFullDay(int year, int month, int day, LunarDataSource dataSource) {
  final solar = Solar.fromYmd(year, month, day);
  final lunar = solar.getLunar();
  final data = dataSource.getDayData(DateTime(year, month, day));

  // ignore: avoid_print
  print('\n${"=" * 70}');
  // ignore: avoid_print
  print('FULL DAY DATA — $year-$month-$day');
  // ignore: avoid_print
  print('${"=" * 70}');

  // ignore: avoid_print
  print('\n--- Basic Info ---');
  // ignore: avoid_print
  print('Solar: $year-$month-$day (weekday ${DateTime(year, month, day).weekday})');
  // ignore: avoid_print
  print('Lunar: ${lunar.getMonthInChinese()}月${lunar.getDayInChinese()}');
  // ignore: avoid_print
  print('Year GanZhi: ${data.yearGanZhi}');
  // ignore: avoid_print
  print('Day GanZhi: ${data.dayGanZhi}');
  // ignore: avoid_print
  print('Zodiac: ${data.yearShengXiao}');
  // ignore: avoid_print
  print('Wu Xing: ${data.dayWuXing}');
  // ignore: avoid_print
  print('Solar term: ${data.currentSolarTerm} (day ${data.solarTermDayCount})');
  // ignore: avoid_print
  print('Day Officer (值): ${lunar.getZhiXing()}');

  // ignore: avoid_print
  print('\n--- Auspicious Activities (宜) ---');
  for (final yi in data.dayYi) {
    // ignore: avoid_print
    print('  ✓ $yi');
  }

  // ignore: avoid_print
  print('\n--- Inauspicious Activities (忌) ---');
  for (final ji in data.dayJi) {
    // ignore: avoid_print
    print('  ✗ $ji');
  }

  // ignore: avoid_print
  print('\n--- Peng Zu Taboos ---');
  // ignore: avoid_print
  print('  Gan: ${lunar.getPengZuGan()}');
  // ignore: avoid_print
  print('  Zhi: ${lunar.getPengZuZhi()}');

  // ignore: avoid_print
  print('\n--- Clash ---');
  // ignore: avoid_print
  print('  Chong: ${lunar.getDayChong()} (${lunar.getDayChongDesc()})');
  // ignore: avoid_print
  print('  Sha: ${lunar.getDaySha()}');
}
