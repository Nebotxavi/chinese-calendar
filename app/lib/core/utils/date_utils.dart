import 'package:feng_shui_calendar/core/constants/app_dates.dart';

DateTime clampDate(DateTime date) {
  if (date.isBefore(AppDates.minDate)) {
    return AppDates.minDate;
  }
  if (date.isAfter(AppDates.maxDate)) {
    return AppDates.maxDate;
  }
  return DateTime(date.year, date.month, date.day);
}

bool canGoNext(DateTime current) {
  return current.isBefore(AppDates.maxDate);
}

bool canGoPrev(DateTime current) {
  return current.isAfter(AppDates.minDate);
}
