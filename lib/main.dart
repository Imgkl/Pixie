import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixie/splash.dart';
import 'package:pixie/error.dart';

void main() async {
  bool result = await DataConnectionChecker().hasConnection;
  if (result == true) {
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
  } else {
    runApp(Error());
  }
}
