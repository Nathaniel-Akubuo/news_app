// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../screens/home/home_page_view.dart';
import '../screens/news_details/news_page_view.dart';

class Routes {
  static const String homePageView = '/';
  static const String newsPageView = '/news-page-view';
  static const all = <String>{
    homePageView,
    newsPageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePageView, page: HomePageView),
    RouteDef(Routes.newsPageView, page: NewsPageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
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
  };
}
