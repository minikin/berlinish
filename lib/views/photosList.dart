import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  bool isFetchingNextPage = false;
  ScrollController _scrollController = new ScrollController();

  @override
  initState(){
    super.initState();
    _getPhotos();
      //_aboutToReachScrollEnd();
      // _getData();
  }

  _getPhotos() async {
    var stream = await photo.getPhotos(); 
    stream.listen((photo) => setState(() =>
        photoList.add(photo)
      )
    );
    print('Get Photos!');
  }

  _getData() async {
    var stream = await photo.getData(1); 
      stream.listen((page) => print(page)
    );
  }

  _aboutToReachScrollEnd() {
    _scrollController.addListener(() {
        double offset = _scrollController.position.maxScrollExtent - 500.0;
        var load = _scrollController.offset;
        if (load >= offset){
          print('_aboutToReachScrollEnd');
        }
    });
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
         },
         controller: _scrollController,
      ),
     );
   }
}