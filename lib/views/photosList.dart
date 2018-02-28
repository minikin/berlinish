import 'package:flutter/material.dart';

import '../models/photo.dart' as photo;
import '../views/photoItem.dart';

class PhotosList extends StatefulWidget {
  PhotosList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PhotosListState createState() => new _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  var photoList = <photo.Photo>[];

  _getPhotos() async {
    var stream = await photo.getPhotos(); 
    stream.listen(
      (photo) => setState(() => photoList.add(photo))
      // (photo) => print(photo)
    );
  }

  @override
  initState(){
    super.initState();
    _getPhotos();
  }

  @override
   Widget build(BuildContext context) {
     return new Scaffold(
       body: new ListView.builder(
         itemExtent: 150.0,
         itemCount:  photoList.length,
         itemBuilder: (context, index) {
           final photo = photoList[index];
           return new PhotoWidget(photo);
         }
      ),
     );
   }
}