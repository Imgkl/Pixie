import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CustomStaggeredGrid {
  int crossAxisCount;
  int itemCount;
  String image;
  List<Widget> items = [];

  // List<Widget> generateWidget() {
  //   List.generate(crossAxisCount, (i) {
  //     print("Gene : "+i.toString());
  //     Container(
  //       width: 200.0,
  //       height: crossAxisCount % 2 == 0
  //           ? itemCount % 2 == 0 ? 300.0 : 200.0
  //           : itemCount % 2 == 0 ? 200.0 : 300.0,
  //       color: Colors.red,
  //       child: Text("Hello"),
  //     );
  //   });

  //   return items;
  // }

  final String url1 =
      "https://pixabay.com/api/?key=13633104-95fec859d1f7f7690d43e6ce9&editors_choice=true" +
          "&pretty=true&per_page=200&orientation=vertical&colors=grayscale&safesearch=true&imagetype=photo";

  Future<Map> getImages1() async {
    try {
      var response = await http.get(url1);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
    }
  }

  List<Widget> generateWidget() {
    List.generate(crossAxisCount, (i) {
      items.add(
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: crossAxisCount % 2 == 0 ? 400.0 : 200.0,
                  color: Colors.red,
                  child: Text("Hello"),
                )
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10.0),
                  height: crossAxisCount % 2 == 0 ? 350.0 : 200.0,
                  color: Colors.red,
                  child: Text("Hello Word"),
                ),
              ),
            ],
          ),
        ),
      );
    });

    return items;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImages1(),
        builder: (context, snapshot) {
          Map data = snapshot.data;
          return Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, i) {
                return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Wrap(
                          children: generateWidget(),
                        )
                      ],
                    ));
              },
            ),
          );
        });
  }

  CustomStaggeredGrid(
      {@required this.crossAxisCount,
      @required this.itemCount,
      @required this.image});
}
