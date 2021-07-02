import 'package:news_app/screens/home/home_page_view.dart';
import 'package:news_app/screens/news_details/news_page_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomePageView, initial: true),
  MaterialRoute(page: NewsPageView)
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
