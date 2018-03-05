import 'dart:async';

class PagedResponse<T extends Stream>  {
  int currentPage;
  int numberOfPages;
  int totalResults;
  List<T> data;

  PagedResponse.fromJson(this.currentPage, Map jsonMap) :
    numberOfPages = jsonMap['total_pages'],
    totalResults = jsonMap['total'];
}