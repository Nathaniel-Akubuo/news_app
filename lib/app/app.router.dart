// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../pages/home/home_page_view.dart';
import '../pages/initial/initial_view.dart';
import '../pages/news_details/news_page_view.dart';
import '../pages/profile/profile_page.dart';
import '../pages/results_page/results_page.dart';
import '../pages/search/search_page.dart';

class Routes {
  static const String initialPageView = '/';
  static const String homePageView = '/home-page-view';
  static const String newsPageView = '/news-page-view';
  static const String profilePage = '/profile-page';
  static const String resultsPage = '/results-page';
  static const String searchPage = '/search-page';
  static const all = <String>{
    initialPageView,
    homePageView,
    newsPageView,
    profilePage,
    resultsPage,
    searchPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initialPageView, page: InitialPageView),
    RouteDef(Routes.homePageView, page: HomePageView),
    RouteDef(Routes.newsPageView, page: NewsPageView),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.resultsPage, page: ResultsPage),
    RouteDef(Routes.searchPage, page: SearchPage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    InitialPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InitialPageView(),
        settings: data,
      );
    },
    HomePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePageView(),
        settings: data,
      );
    },
    NewsPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewsPageView(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(),
        settings: data,
      );
    },
    ResultsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResultsPage(),
        settings: data,
      );
    },
    SearchPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchPage(),
        settings: data,
      );
    },
  };
}
