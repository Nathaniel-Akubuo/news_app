import 'package:flutter/cupertino.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/util/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String getUrl(BuildContext context) {
    return Provider.of<Services>(context).url;
  }

  String getTitle(BuildContext context) {
    return Provider.of<Services>(context).title;
  }

  void close() {
    _navigationService.back();
  }
}
