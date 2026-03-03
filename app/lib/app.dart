import 'package:flutter/material.dart';

import 'package:feng_shui_calendar/core/constants/app_colors.dart';
import 'package:feng_shui_calendar/presentation/screens/calendar_screen.dart';

class FengShuiCalendarApp extends StatelessWidget {
  const FengShuiCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huangli, tu calendario lunar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.gold,
          brightness: Brightness.dark,
        ),
      ),
      home: const CalendarScreen(),
    );
  }
}
