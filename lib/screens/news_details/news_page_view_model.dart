import 'package:flutter/cupertino.dart';
import 'package:news_app/util/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class NewsPageViewModel extends BaseViewModel {
  String getUrl(BuildContext context) {
    return Provider.of<Services>(context).url;
  }

  String getTitle(BuildContext context) {
    return Provider.of<Services>(context).title;
  }
}
