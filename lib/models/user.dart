class Author {
  final String id;
  final String name;
  final String profileImage;

  Author.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    name = jsonMap['name'],
    profileImage = jsonMap['profile_image']['large'];

  String toString() => 'Author: $name';
}