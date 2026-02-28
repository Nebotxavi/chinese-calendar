import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:feng_shui_calendar/core/utils/date_utils.dart';
import 'package:feng_shui_calendar/data/datasources/lunar_data_source.dart';
import 'package:feng_shui_calendar/data/datasources/proverb_data_source.dart';
import 'package:feng_shui_calendar/data/repositories/calendar_repository.dart';
import 'package:feng_shui_calendar/data/repositories/calendar_repository_impl.dart';
import 'package:feng_shui_calendar/data/repositories/proverb_repository.dart';
import 'package:feng_shui_calendar/data/repositories/proverb_repository_impl.dart';
import 'package:feng_shui_calendar/domain/calendar_day.dart';

final lunarDataSourceProvider = Provider<LunarDataSource>((ref) {
  return LunarDataSource();
});

final proverbDataSourceProvider = Provider<ProverbDataSource>((ref) {
  return ProverbDataSource();
});

final proverbRepositoryProvider = Provider<ProverbRepository>((ref) {
  return ProverbRepositoryImpl(ref.watch(proverbDataSourceProvider));
});

final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  return CalendarRepositoryImpl(
    ref.watch(lunarDataSourceProvider),
    ref.watch(proverbRepositoryProvider),
  );
});

final selectedDateProvider = StateProvider<DateTime>((ref) {
  return clampDate(DateTime.now());
});

final calendarDayProvider = FutureProvider<CalendarDay>((ref) async {
  final date = ref.watch(selectedDateProvider);
  final repository = ref.watch(calendarRepositoryProvider);
  return repository.getDay(date);
});
