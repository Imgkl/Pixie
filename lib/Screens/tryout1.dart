import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:pixie/Screens/imageScreen.dart';
import 'package:pixie/Screens/Custom_grid.dart';

class Tryout extends StatefulWidget {
  @override
  _TryoutState createState() => _TryoutState();
}

class _TryoutState extends State<Tryout> {
  @override
  Widget build(BuildContext context) {
    int index = 4;
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

    final String url2 =
        "https://pixabay.com/api/?key=13633104-95fec859d1f7f7690d43e6ce9&editors_choice=true" +
            "&pretty=true&per_page=200&orientation=vertical&colors=grayscale&safesearch=true&imagetype=photo&page=2";

    Future<Map> getImages2() async {
      try {
        var response = await http.get(url2);

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          throw Exception("error");
        }
      } catch (e) {
        print(e);
      }
    }

    return FutureBuilder(
        future: getImages1(),
        builder: (context, snapshot) {
          Map data = snapshot.data;
          if (snapshot.hasData) {
            CustomStaggeredGrid(
                    itemCount: 1,
                    crossAxisCount: 6,
                    image: data["hits"][index]["largeImageURl"])
                .build(context);
          }
          return CustomStaggeredGrid(
                  itemCount: 1,
                  crossAxisCount: 6,
                  image: data["hits"][index]["largeImageURl"])
              .build(context);
        });
  }
}
