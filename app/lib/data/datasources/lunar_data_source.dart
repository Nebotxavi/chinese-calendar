import 'package:lunar/lunar.dart';

class LunarDayRawData {
  final String yearGanZhi;
  final String dayGanZhi;
  final String lunarMonthName;
  final String lunarDayName;
  final String yearShengXiao;
  final List<String> dayYi;
  final List<String> dayJi;
  final String dayWuXing;
  final String currentSolarTerm;
  final int solarTermDayCount;
  final int weekdayIndex;

  const LunarDayRawData({
    required this.yearGanZhi,
    required this.dayGanZhi,
    required this.lunarMonthName,
    required this.lunarDayName,
    required this.yearShengXiao,
    required this.dayYi,
    required this.dayJi,
    required this.dayWuXing,
    required this.currentSolarTerm,
    required this.solarTermDayCount,
    required this.weekdayIndex,
  });
}

/// Wraps the `lunar` package. This is the ONLY file that imports it.
class LunarDataSource {
  LunarDayRawData getDayData(DateTime date) {
    final solar = Solar.fromYmd(date.year, date.month, date.day);
    final lunar = solar.getLunar();
    final eightChar = lunar.getEightChar();

    // getCurrentJieQi() only returns on the exact start date.
    // Use prevJie/prevQi to find the most recent solar term.
    final prevJie = lunar.getPrevJie();
    final prevQi = lunar.getPrevQi();

    final jieSolar = prevJie.getSolar();
    final qiSolar = prevQi.getSolar();
    final jieDate = DateTime(
      jieSolar.getYear(),
      jieSolar.getMonth(),
      jieSolar.getDay(),
    );
    final qiDate = DateTime(
      qiSolar.getYear(),
      qiSolar.getMonth(),
      qiSolar.getDay(),
    );

    // Check if today IS the start of a jie or qi
    final currentJieQi = lunar.getCurrentJieQi();
    final String solarTermName;
    final int dayCount;

    if (currentJieQi != null) {
      solarTermName = currentJieQi.getName();
      dayCount = 1;
    } else {
      // Pick the more recent between prevJie and prevQi
      final useJie = jieDate.isAfter(qiDate);
      solarTermName = useJie ? prevJie.getName() : prevQi.getName();
      final termStartDate = useJie ? jieDate : qiDate;
      dayCount = date.difference(termStartDate).inDays + 1;
    }

    return LunarDayRawData(
      yearGanZhi: lunar.getYearInGanZhi(),
      dayGanZhi: lunar.getDayInGanZhi(),
      lunarMonthName: lunar.getMonthInChinese(),
      lunarDayName: lunar.getDayInChinese(),
      yearShengXiao: lunar.getYearShengXiao(),
      dayYi: lunar.getDayYi(),
      dayJi: lunar.getDayJi(),
      dayWuXing: eightChar.getDayWuXing(),
      currentSolarTerm: solarTermName,
      solarTermDayCount: dayCount,
      weekdayIndex: date.weekday,
    );
  }
}
