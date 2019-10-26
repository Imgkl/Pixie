import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pixie/Screens/imageScreen.dart';

class ResultPage extends StatefulWidget {
  final String category;
  ResultPage({this.category});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final String url =
        "https://pixabay.com/api/?key=13633104-95fec859d1f7f7690d43e6ce9&q=${widget.category}&pretty=true&" +
            "per_page=200&colors=grayscale&safesearch=true&imagetype=photo";

    Future<Map> getImages(String category) async {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("error");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        leading: InkWell(
            child: Icon(FontAwesomeIcons.arrowLeft),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: FutureBuilder<Map>(
        future: getImages(widget.category),
        builder: (context, snapshot) {
          Map data = snapshot.data;

          if (snapshot.hasError) {
            return Text("Error occured");
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: (data["hits"] as List).length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          placeholder: (context, index) => SpinKitRipple(
                            size: 50,
                            color: Colors.black,
                          ),
                          imageUrl: data['hits'][index]['largeImageURL'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageScreen(
                                data: snapshot.data,
                                index: index,
                                largeImageURL: data['hits'][index]
                                    ['largeImageURL'],
                                user: data['hits'][index]['user'],
                                views: data['hits'][index]['views'],
                                downloads: data['hits'][index]['downloads'],
                                imageURL: data['hits'][index]
                                    ['largeImageURL'])));
                  }),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
