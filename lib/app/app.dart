import 'package:news_app/pages/home/home_page_view.dart';
import 'package:news_app/pages/initial/initial_view.dart';
import 'package:news_app/pages/news_details/news_page_view.dart';
import 'package:news_app/pages/profile/profile_page.dart';
import 'package:news_app/pages/results_page/results_page.dart';
import 'package:news_app/pages/search/search_page.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: InitialPageView, initial: true),
  MaterialRoute(page: HomePageView),
  MaterialRoute(page: NewsPageView),
  MaterialRoute(page: ProfilePage),
  MaterialRoute(page: ResultsPage),
  MaterialRoute(page: SearchPage),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
