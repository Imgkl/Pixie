import 'package:flutter/material.dart';
import 'package:pixie/Screens/resultPage.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController controllerText = TextEditingController();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (String value) {
                  if (value.length == 0) {
                    return 'Empty search? Random!';
                  }
                },
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Awesome Search here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    contentPadding: EdgeInsets.only(
                        left: 20, top: 15, right: 20, bottom: 15)),
                controller: controllerText,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Material(
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  category: controllerText.text,
                                )));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
