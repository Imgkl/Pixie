import 'package:flutter/material.dart';
import 'package:pixie/Screens/TopPost.dart';
import 'package:pixie/Screens/search.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixie',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        canvasColor: Colors.white,
      ),
      home: MyHomePage(),
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pixie"),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          TopPost(),
          Search(),
        ],
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
                child: Icon(Icons.image),
                onPressed: () {
                  setState(() {
                    controller.jumpToPage(0);
                  });
                },
              ),
              VerticalDivider(),
              MaterialButton(
                child: Icon(Icons.search),
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
