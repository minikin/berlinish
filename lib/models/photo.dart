import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../configs/keys.dart' show key;
import './author.dart';
import './pagedResponse.dart';

class Photo {
  final String id;
  final String imagePath;
  final String description;
  final Author author;

  Photo.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    imagePath = jsonMap['urls']['small'],
    description = jsonMap['description'],
    author = new Author.fromJson(jsonMap['user']);
  
  String toString() => 'Photo: $author';
}

Future<Stream<Photo>> getPhotos({int page = 1}) async {
  var url = 'https://api.unsplash.com/search/photos/?'+
              'client_id=$key'+
              '&per_page=30'+
              '&page=$page' +
              '&query=berlin';

  var client = new http.Client();
  var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));
 
  return streamedRes.stream
    .transform(UTF8.decoder)
    .transform(JSON.decoder)
    .expand((jsonBody) => (jsonBody as Map)['results'])
    .map((jsonPlace) => new Photo.fromJson(jsonPlace));
}

// Future<PagedResponse<Photo>> getData([int page = 1]) async {
//     var url = 'https://api.unsplash.com/search/photos/?'+
//               'client_id=$key'+
//               '&per_page=30'+
//               '&page=$page' +
//               '&query=berlin';

//   var client = new http.Client();
//   var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));
//   var mainStream = streamedRes.stream.transform(UTF8.decoder).transform(JSON.decoder);

//   return mainStream
//     .transform(UTF8.decoder)
//     .transform(JSON.decoder)
//     .map((json) =>  
//       new PagedResponse.fromJson(page, json),
//       );
// }