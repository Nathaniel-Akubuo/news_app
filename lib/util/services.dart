import 'package:flutter/foundation.dart';

class Services extends ChangeNotifier {
  var _keyword;
  var _title;
  var _url;

  set keyword(String keyword) {
    _keyword = keyword;
    notifyListeners();
  }

  set title(String title) {
    _title = title;
    notifyListeners();
  }

  set url(String url) {
    _url = url;
    notifyListeners();
  }

  get keyword => _keyword;

  get title => _title;

  get url => _url;
}
