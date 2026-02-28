import 'package:feng_shui_calendar/domain/calendar_day.dart';

abstract class CalendarRepository {
  Future<CalendarDay> getDay(DateTime date);
}
