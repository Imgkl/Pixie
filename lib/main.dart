import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pixie/sucess.dart';
import 'package:pixie/error.dart';

void main() async {
  await FlutterDownloader.initialize();
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
    runApp(MyApp());
  } else {
    runApp(Error());
  }
}
