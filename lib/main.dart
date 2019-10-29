import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixie/splash.dart';
import 'package:pixie/error.dart';

void main()
 {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(Splash());
}
