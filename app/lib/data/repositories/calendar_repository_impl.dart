import 'package:feng_shui_calendar/data/datasources/lunar_data_source.dart';
import 'package:feng_shui_calendar/data/repositories/calendar_repository.dart';
import 'package:feng_shui_calendar/data/repositories/proverb_repository.dart';
import 'package:feng_shui_calendar/data/translations/activity_translations.dart';
import 'package:feng_shui_calendar/data/translations/element_translations.dart';
import 'package:feng_shui_calendar/data/translations/solar_term_translations.dart';
import 'package:feng_shui_calendar/data/translations/weekday_translations.dart';
import 'package:feng_shui_calendar/domain/calendar_day.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final LunarDataSource _lunarDataSource;
  final ProverbRepository _proverbRepository;

  CalendarRepositoryImpl(this._lunarDataSource, this._proverbRepository);

  @override
  Future<CalendarDay> getDay(DateTime date) async {
    final raw = _lunarDataSource.getDayData(date);
    final proverb = await _proverbRepository.getProverbForDate(date);

    final elementZh = _extractElement(raw.dayWuXing);
    final elementEs = elementTranslations[elementZh] ?? elementZh;

    return CalendarDay(
      date: date,
      year: date.year,
      month: date.month,
      day: date.day,
      weekdayEs: weekdaySpanish[date.weekday] ?? '',
      weekdayZh: weekdayChinese[date.weekday] ?? '',
      lunarDateDisplay:
          '${raw.yearGanZhi}年 · ${raw.lunarMonthName}月${raw.lunarDayName}',
      yearGanZhi: raw.yearGanZhi,
      dayGanZhi: '${raw.dayGanZhi}日',
      elementZh: elementZh,
      elementEs: elementEs,
      solarTermZh: raw.currentSolarTerm,
      solarTermEs:
          solarTermTranslations[raw.currentSolarTerm] ?? raw.currentSolarTerm,
      solarTermDayCount: raw.solarTermDayCount,
      auspiciousZh: raw.dayYi,
      auspiciousEs: raw.dayYi.map(translateActivity).toList(),
      inauspiciousZh: raw.dayJi,
      inauspiciousEs: raw.dayJi.map(translateActivity).toList(),
      proverb: proverb,
    );
  }

  String _extractElement(String wuXing) {
    if (wuXing.isEmpty) {
      return '';
    }
    // getDayWuXing() returns pairs like "火火" — take the first character
    return wuXing.substring(0, 1);
  }
}
