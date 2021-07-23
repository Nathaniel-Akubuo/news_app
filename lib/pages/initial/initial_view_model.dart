import 'package:news_app/pages/home/home_page_view.dart';
import 'package:news_app/pages/profile/profile_page.dart';
import 'package:news_app/pages/search/search_page.dart';
import 'package:stacked/stacked.dart';

class InitialViewModel extends BaseViewModel {
  int currentIndex = 0;
  var pages = [HomePageView(), SearchPage(), ProfilePage()];

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
