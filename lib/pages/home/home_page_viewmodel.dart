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
  NewsTileModel newsOfTheDay;


  Future<Color> generateTextColor(BuildContext context) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(newsOfTheDay.imageURL),
      filters: [],
      size: Size(400, 400),
      region: Offset.zero & Size(200, 200),
    );
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
    newsOfTheDay = await apiHandler.getNewsOfTheDay();
    notifyListeners();
  }


}
