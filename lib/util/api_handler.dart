import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:news_app/constants/keys.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_tile_model.dart';

class APIHandler extends ChangeNotifier {
  List<NewsTileModel> _newsList = [];
  List<NewsTileModel> searchResults = [];

  Future getHeadlines() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ng&pagesize=100&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      print(response.statusCode);
  }

  Future addItems() async {
    var response = await getHeadlines();
    int totalResults = response['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var data = response['articles'][i];
      newsList.add(NewsTileModel(
        source: data['source']['name'],
        imageURL: data['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : data['urlToImage'],
        url: data['url'],
        title: data['title'],
        description: data['description'],
        publishedAt:
        DateFormat('MMMM d, y').format(DateTime.parse(data['publishedAt'])),
      ));
      notifyListeners();
    }
  }

  Future getNewsCategory(String category) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=$apiKey&pageSize=100'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }

  Future<void> searchKeyword({String keyword}) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/everything?qInTitle=$keyword&apiKey=$apiKey&pageSize=100'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      int totalResults = data['totalResults'];
      for (int i = 0; i < totalResults; i++) {
        var currentItem = data['articles'][i];
        searchResults.add(NewsTileModel(
          source: currentItem['source']['name'],
          imageURL: currentItem['urlToImage'],
          url: currentItem['url'],
          title: currentItem['title'],
          description: currentItem['description'],
          publishedAt: DateFormat('MMMM d, y')
              .format(DateTime.parse(currentItem['publishedAt'])),
        ));
        notifyListeners();
      }
    } else {
      print(response.statusCode);
    }
  }

  get newsList => _newsList;
}
