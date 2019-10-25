import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:pixie/photo.dart';

class HomePaper extends StatefulWidget {
  const HomePaper({Key key}) : super(key: key);

  @override
  _HomePaperState createState() => _HomePaperState();
}

class _HomePaperState extends State<HomePaper> {
  @override
  // client_id=8023fd5db7462dadbad29f626615a5ae250daa9a1bd35d785b823ed1b44d3cfe
  Widget build(BuildContext context) {
    final _headers = {
      "Authorization":
          "Client-ID 8023fd5db7462dadbad29f626615a5ae250daa9a1bd35d785b823ed1b44d3cfe"
    };

    final String url = "https://api.unsplash.com/photos/page=1";

    Future<Photo> requestPhoto(String id) async {
      String url = "https://api.unsplash.com/photos/$id";
      var data = await http.get(url, headers: _headers);
      var jsonResult = json.decode(data.body);
      return new Photo.fromJSON(jsonResult);
    }

    return FutureBuilder(
      future: requestPhoto("1"),
      builder: (context, snapshot) {
        if (snapshot.hasData){
                  child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 15,
            itemBuilder: (BuildContext context, snapshot) => new Container(
                color: Colors.green,
                child: Image.network(snapshot.toString()) 
                ),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        
        }
        return CircularProgressIndicator();
      },
    );
  }
}
