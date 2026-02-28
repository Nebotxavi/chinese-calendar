import 'dart:math';

import 'package:feng_shui_calendar/data/datasources/proverb_data_source.dart';
import 'package:feng_shui_calendar/data/repositories/proverb_repository.dart';
import 'package:feng_shui_calendar/domain/proverb.dart';

class ProverbRepositoryImpl implements ProverbRepository {
  final ProverbDataSource _dataSource;

  Map<int, int>? _assignmentMap;
  List<Proverb>? _allProverbs;

  ProverbRepositoryImpl(this._dataSource);

  @override
  Future<List<Proverb>> getAllProverbs() async {
    _allProverbs ??= await _dataSource.loadProverbs();
    return _allProverbs!;
  }

  @override
  Future<Proverb> getProverbForDate(DateTime date) async {
    final proverbs = await getAllProverbs();
    final map = _getAssignmentMap(proverbs);

    final dayOfYear = _dayOfYear(date);
    final proverbIndex = map[dayOfYear];

    if (proverbIndex != null && proverbIndex < proverbs.length) {
      return proverbs[proverbIndex];
    }

    return proverbs[dayOfYear % proverbs.length];
  }

  Map<int, int> _getAssignmentMap(List<Proverb> proverbs) {
    if (_assignmentMap != null) {
      return _assignmentMap!;
    }

    _assignmentMap = {};
    final usedIndices = <int>{};

    // Phase 1: solar-term proverbs go to their start dates
    for (var i = 0; i < proverbs.length; i++) {
      final p = proverbs[i];
      if (p.solarTerm == null) {
        continue;
      }
      final termDate = _solarTermDates2026[p.solarTerm];
      if (termDate != null) {
        final doy = _dayOfYear(termDate);
        if (!_assignmentMap!.containsKey(doy)) {
          _assignmentMap![doy] = i;
          usedIndices.add(i);
        }
      }
    }

    // Phase 2: fill remaining days with other proverbs (fixed-seed shuffle)
    final remaining = <int>[];
    for (var i = 0; i < proverbs.length; i++) {
      if (!usedIndices.contains(i)) {
        remaining.add(i);
      }
    }
    remaining.shuffle(Random(20260301));

    final startDoy = _dayOfYear(DateTime(2026, 3, 1));
    final endDoy = _dayOfYear(DateTime(2026, 12, 31));
    var remainingIdx = 0;

    for (var doy = startDoy; doy <= endDoy; doy++) {
      if (!_assignmentMap!.containsKey(doy) &&
          remainingIdx < remaining.length) {
        _assignmentMap![doy] = remaining[remainingIdx];
        remainingIdx++;
      }
    }

    return _assignmentMap!;
  }

  int _dayOfYear(DateTime date) {
    return date.difference(DateTime(date.year, 1, 1)).inDays + 1;
  }

  // 2026 solar term start dates (approximate, for proverb assignment)
  static final Map<String, DateTime> _solarTermDates2026 = {
    '惊蛰': DateTime(2026, 3, 5),
    '春分': DateTime(2026, 3, 20),
    '清明': DateTime(2026, 4, 5),
    '谷雨': DateTime(2026, 4, 20),
    '立夏': DateTime(2026, 5, 5),
    '小满': DateTime(2026, 5, 21),
    '芒种': DateTime(2026, 6, 5),
    '夏至': DateTime(2026, 6, 21),
    '小暑': DateTime(2026, 7, 7),
    '大暑': DateTime(2026, 7, 22),
    '立秋': DateTime(2026, 8, 7),
    '处暑': DateTime(2026, 8, 23),
    '白露': DateTime(2026, 9, 7),
    '秋分': DateTime(2026, 9, 23),
    '寒露': DateTime(2026, 10, 8),
    '霜降': DateTime(2026, 10, 23),
    '立冬': DateTime(2026, 11, 7),
    '小雪': DateTime(2026, 11, 22),
    '大雪': DateTime(2026, 12, 7),
    '冬至': DateTime(2026, 12, 22),
  };
}
