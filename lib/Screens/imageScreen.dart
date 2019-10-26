import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageScreen extends StatefulWidget {
  final image;
  final data;
  final int views;
  final String user;
  final int downloads;
  final int index;
  final imageURL;

  const ImageScreen(
      {Key key,
      this.image,
      this.data,
      this.index,
      this.imageURL,
      this.downloads,
      this.views,
      this.user})
      : super(key: key);
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.index,
            child: CachedNetworkImage(
              imageUrl: widget.imageURL,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.eye),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.views.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.download),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.downloads.toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.idBadge),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.user),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
