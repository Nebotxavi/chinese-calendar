import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// TODO: Re-enable ads — commented out due to ANR on emulator
// import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:feng_shui_calendar/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Re-enable ads
  // MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const ProviderScope(child: FengShuiCalendarApp()));
}
