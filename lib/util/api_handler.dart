import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:news_app/constants/keys.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_tile_model.dart';

class APIHandler extends ChangeNotifier {
  List<NewsTileModel> newsList = [];
  NewsTileModel _newsOfTheDay;

  Future getHeadlines() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ng&pagesize=100&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else
      print(response.statusCode);
  }

  getNewsOfTheDay() {
    getHeadlines().then((value) {
      var data = value['articles'][0];
      newsOfTheDay = NewsTileModel(
          source: data['source']['name'],
          imageURL: data['urlToImage'],
          url: data['url'],
          title: data['title']);
    });
  }

  set newsOfTheDay(NewsTileModel model) {
    _newsOfTheDay = model;
    notifyListeners();
  }

  get newsOfTheDay => _newsOfTheDay;

  addItems() async {
    var response = await getHeadlines();
    int totalResults = response['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var data = response['articles'][i];
      newsList.add(NewsTileModel(
        source: data['source']['name'],
        imageURL: data['urlToImage'],
        url: data['url'],
        title: data['title'],
        description: data['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(data['publishedAt'])),
      ));
    }
    notifyListeners();
  }

  getNewsCategory(String category) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }
}
