import 'package:flutter/material.dart';

import 'App.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Planet X app",

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text("Planet X App",
          ),
          centerTitle: true,
        ),
       backgroundColor: Colors.blueGrey,
        body: App(),
      ),

    );
  }


}