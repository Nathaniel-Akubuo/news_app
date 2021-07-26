import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/util/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  var _business = 'business';
  var _entertainment = 'entertainment';
  var _health = 'health';
  var _science = 'science';
  var _sports = 'sports';
  var _technology = 'technology';

  TextEditingController controller = TextEditingController();
  List<NewsTileModel> _businessNewsList = [];
  List<NewsTileModel> _entertainmentNewsList = [];
  List<NewsTileModel> _healthNewsList = [];
  List<NewsTileModel> _scienceNewsList = [];
  List<NewsTileModel> _sportsNewsList = [];
  List<NewsTileModel> _technologyNewsList = [];

  void onSubmitted(context) async {
    _navigationService.navigateTo(Routes.resultsPage);
    Provider.of<Services>(context, listen: false).keyword = controller.text;
  }

  Future<void> getBusinessNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_business);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var currentItem = data['articles'][i];
      _businessNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  Future<void> getEntertainmentNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_entertainment);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var currentItem = data['articles'][i];
      _entertainmentNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  Future<void> getHealthNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_health);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var currentItem = data['articles'][i];
      _healthNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  Future<void> getScienceNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_science);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var currentItem = data['articles'][i];
      _scienceNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  Future<void> getSportsNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_sports);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults - 10; i++) {
      var currentItem = data['articles'][i];
      _sportsNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  Future<void> getTechnologyNews(context) async {
    var data = await Provider.of<APIHandler>(context, listen: false)
        .getNewsCategory(_technology);
    int totalResults = data['totalResults'];
    for (int i = 0; i < totalResults; i++) {
      var currentItem = data['articles'][i];
      _technologyNewsList.add(NewsTileModel(
        source: currentItem['source']['name'],
        imageURL: currentItem['urlToImage'] == null
            ? 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'
            : currentItem['urlToImage'],
        url: currentItem['url'],
        title: currentItem['title'],
        description: currentItem['description'],
        publishedAt:
            DateFormat.yMd().format(DateTime.parse(currentItem['publishedAt'])),
      ));
    }
  }

  List<NewsTileModel> get technologyNewsList => _technologyNewsList;

  List<NewsTileModel> get sportsNewsList => _sportsNewsList;

  List<NewsTileModel> get scienceNewsList => _scienceNewsList;

  List<NewsTileModel> get healthNewsList => _healthNewsList;

  List<NewsTileModel> get entertainmentNewsList => _entertainmentNewsList;

  List<NewsTileModel> get businessNewsList => _businessNewsList;
}
