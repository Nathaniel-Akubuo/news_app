import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/util/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  NewsTileModel _newsOfTheDay;

  Future<Color> generateTextColor(BuildContext context) async {
    final _mediaQuery = MediaQuery.of(context).size;
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
            NetworkImage(newsOfTheDay.imageURL),
            filters: [],
            size: Size(_mediaQuery.width, _mediaQuery.height * 0.5),
//            region: Rect.fromPoints(
//                Offset(_mediaQuery.width, _mediaQuery.height / 4),
//                Offset(_mediaQuery.width, _mediaQuery.height / 2))
                );
    print(paletteGenerator.dominantColor.color);
    return paletteGenerator.dominantColor.color.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  void navigateToNewsPage({String url, String title, BuildContext context}) {
    _navigationService.navigateTo(Routes.newsPageView);
    Provider.of<Services>(context, listen: false).url = url;
    Provider.of<Services>(context, listen: false).title = title;
  }

  Future<void> setNewsOfTheDay(BuildContext context) async {
    var apiHandler = Provider.of<APIHandler>(context, listen: false);
    var response = await apiHandler.getHeadlines();
    var data = response['articles'][1];
    _newsOfTheDay = NewsTileModel(
        imageURL: data['urlToImage'], url: data['url'], title: data['title']);
  }

//  Future addItems(context) async {
//    var apiHandler = Provider.of<APIHandler>(context, listen: false);
//    var response = await apiHandler.getHeadlines();
//    int totalResults = response['totalResults'];
//    for (int i = 0; i < totalResults; i++) {
//      var data = response['articles'][i];
//      _newsList.add(NewsTileModel(
//        source: data['source']['name'],
//        imageURL: data['urlToImage'],
//        url: data['url'],
//        title: data['title'],
//        description: data['description'],
//        publishedAt:
//            DateFormat.yMd().format(DateTime.parse(data['publishedAt'])),
//      ));
//    }
//  }

  get newsOfTheDay => _newsOfTheDay;
}
