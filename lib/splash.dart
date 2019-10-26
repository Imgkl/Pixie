import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixie/sucess.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pixie',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.black),
          canvasColor: Colors.white,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Sucess(),
        title: new Text(
          'Pixie',
          style: new TextStyle(
              fontFamily: "desc", fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        image: new Image.asset("assets/splash.png"),
        backgroundColor: Colors.white,
        
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
      ),
    );
  }
}


