import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../models/author.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget(this.photo, this.author);
  final Photo photo;
  final Author author;

  @override
  Widget build(BuildContext context) {
    return  new Container(
      margin: const EdgeInsets.all(4.0),
      child: new Image.network(
        photo.imagePath,
        fit: BoxFit.cover
       ),
    );
  }
}