import 'package:flutter/material.dart';

import './views/photosList.dart';

void main() => runApp(
    new Berlinish()
);

class Berlinish extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Berlinish'),
        ),
        body: new PhotosList(),
      ),
    );
  }
}