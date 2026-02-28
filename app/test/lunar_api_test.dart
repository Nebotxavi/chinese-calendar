import 'package:flutter_test/flutter_test.dart';
import 'package:feng_shui_calendar/data/datasources/lunar_data_source.dart';

void main() {
  late LunarDataSource dataSource;

  setUp(() {
    dataSource = LunarDataSource();
  });

  test('getDayData returns valid data for March 15, 2026', () {
    final date = DateTime(2026, 3, 15);
    final data = dataSource.getDayData(date);

    // Verify we get non-empty data
    expect(data.yearGanZhi, isNotEmpty);
    expect(data.dayGanZhi, isNotEmpty);
    expect(data.lunarMonthName, isNotEmpty);
    expect(data.lunarDayName, isNotEmpty);
    expect(data.yearShengXiao, isNotEmpty);
    expect(data.dayWuXing, isNotEmpty);

    // Activities should be lists
    expect(data.dayYi, isA<List<String>>());
    expect(data.dayJi, isA<List<String>>());

    // Print for inspection
    // ignore: avoid_print
    print('Year GanZhi: ${data.yearGanZhi}');
    // ignore: avoid_print
    print('Day GanZhi: ${data.dayGanZhi}');
    // ignore: avoid_print
    print('Lunar month: ${data.lunarMonthName}');
    // ignore: avoid_print
    print('Lunar day: ${data.lunarDayName}');
    // ignore: avoid_print
    print('Zodiac: ${data.yearShengXiao}');
    // ignore: avoid_print
    print('WuXing: ${data.dayWuXing}');
    // ignore: avoid_print
    print('Solar term: ${data.currentSolarTerm}');
    // ignore: avoid_print
    print('Yi: ${data.dayYi}');
    // ignore: avoid_print
    print('Ji: ${data.dayJi}');
  });

  test('solar term and day count from getDayData', () {
    final date = DateTime(2026, 3, 8);
    final data = dataSource.getDayData(date);
    // ignore: avoid_print
    print('Solar term for March 8: ${data.currentSolarTerm}');
    // ignore: avoid_print
    print('Solar term day count for March 8: ${data.solarTermDayCount}');

    expect(data.currentSolarTerm, isNotEmpty);
    expect(data.solarTermDayCount, greaterThan(0));
  });

  test('getDayData works for multiple dates across coverage range', () {
    final dates = [
      DateTime(2026, 3, 1),
      DateTime(2026, 6, 21), // Summer solstice
      DateTime(2026, 9, 23), // Autumnal equinox
      DateTime(2026, 12, 31),
    ];

    for (final date in dates) {
      final data = dataSource.getDayData(date);
      expect(data.yearGanZhi, isNotEmpty);
      expect(data.dayGanZhi, isNotEmpty);
    }
  });
}
