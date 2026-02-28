import 'package:flutter_test/flutter_test.dart';
import 'package:lunar/lunar.dart';

void main() {
  test('explore solar term API on various dates', () {
    // Test on Jingzhe start date (should be March 5 or 6, 2026)
    for (var day = 4; day <= 8; day++) {
      final solar = Solar.fromYmd(2026, 3, day);
      final lunar = solar.getLunar();

      final current = lunar.getCurrentJieQi();
      final jieQi = lunar.getJieQi();
      final prevJie = lunar.getPrevJie();
      final prevQi = lunar.getPrevQi();

      // ignore: avoid_print
      print('Mar $day: '
          'current=${current?.getName()}, '
          'jieQi=$jieQi, '
          'prevJie=${prevJie.getName()}, '
          'prevQi=${prevQi.getName()}');
    }
  });

  test('explore prevJie/prevQi for day count calculation', () {
    // Use prevJie to compute day count from the nearest preceding jie/qi
    final solar = Solar.fromYmd(2026, 3, 15);
    final lunar = solar.getLunar();

    final prevJie = lunar.getPrevJie();
    final prevQi = lunar.getPrevQi();

    final prevJieSolar = prevJie.getSolar();
    final prevQiSolar = prevQi.getSolar();

    // ignore: avoid_print
    print('March 15:');
    // ignore: avoid_print
    print('  prevJie: ${prevJie.getName()} on '
        '${prevJieSolar.getYear()}-${prevJieSolar.getMonth()}-${prevJieSolar.getDay()}');
    // ignore: avoid_print
    print('  prevQi: ${prevQi.getName()} on '
        '${prevQiSolar.getYear()}-${prevQiSolar.getMonth()}-${prevQiSolar.getDay()}');

    // Compute day count from the more recent of prevJie/prevQi
    final jieDate = DateTime(
      prevJieSolar.getYear(),
      prevJieSolar.getMonth(),
      prevJieSolar.getDay(),
    );
    final qiDate = DateTime(
      prevQiSolar.getYear(),
      prevQiSolar.getMonth(),
      prevQiSolar.getDay(),
    );

    final date = DateTime(2026, 3, 15);
    final nearestTermDate = jieDate.isAfter(qiDate) ? jieDate : qiDate;
    final nearestTermName = jieDate.isAfter(qiDate)
        ? prevJie.getName()
        : prevQi.getName();
    final dayCount = date.difference(nearestTermDate).inDays + 1;

    // ignore: avoid_print
    print('  Nearest term: $nearestTermName, day count: $dayCount');
  });
}
