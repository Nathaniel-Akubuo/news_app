import 'package:flutter/foundation.dart';

class Services extends ChangeNotifier {
  var _url;
  var _title;

  set title(String title) {
    _title = title;
    notifyListeners();
  }

  set url(String url) {
    _url = url;
    notifyListeners();
  }

  get title => _title;

  get url => _url;
}
