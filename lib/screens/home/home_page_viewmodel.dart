import 'package:flutter/cupertino.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/util/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToNewsPage({String url, String title, BuildContext context}) {
    _navigationService.navigateTo(Routes.newsPageView);
    Provider.of<Services>(context, listen: false).url = url;
    Provider.of<Services>(context, listen: false).title = title;
  }

  NewsTileModel getNews(BuildContext context) {
    var apiHandler = Provider.of<APIHandler>(context, listen: false);
    apiHandler.getNewsOfTheDay();
    return apiHandler.newsOfTheDay;
  }
}
