import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../configs/keys.dart' show key;

class Photo {
  final String id;
  final String author;
  final String imagePath;
  final String description;

  Photo.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    author = jsonMap['user']['name'],
    imagePath = jsonMap['urls']['small'],
    description = jsonMap['description'];

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