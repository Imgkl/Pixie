import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pixie/Screens/TopPost.dart';
import 'package:pixie/Screens/search.dart';

class MyApp extends StatelessWidget {
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
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pixie",
          style: TextStyle(fontFamily: "desc", fontSize: 35),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.infoCircle),
                onPressed: () {
                  setState(() {
                    showCupertinoModalPopup(
                      context: (context),
                      builder: (context) => CupertinoActionSheet(
                          title: Text(
                            "Pixie",
                            style: TextStyle(fontSize: 50, fontFamily: "fonta"),
                          ),
                          message: Text(
                            "“When you photograph people in color, you photograph their clothes. But when you photograph people in Black and white, you photograph their souls!”\n\n -Ted Grant",
                            style: TextStyle(fontSize: 30, fontFamily: "desc"),
                          ),
                          cancelButton: CupertinoActionSheetAction(
                            child: Text("Exit the app"),
                            onPressed: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                          )),
                    );
                  });
                },
              ))
        ],
      ),
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            TopPost(),
            Search(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(
          color: Colors.white30,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                child: Icon(FontAwesomeIcons.images),
                onPressed: () {
                  setState(() {
                    controller.jumpToPage(0);
                  });
                },
              ),
              VerticalDivider(
                thickness: 1.5,
              ),
              MaterialButton(
                child: Icon(FontAwesomeIcons.searchengin),
                onPressed: () {
                  setState(() {
                    controller.jumpToPage(1);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
