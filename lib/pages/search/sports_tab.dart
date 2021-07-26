import 'package:flutter/material.dart';
import 'package:news_app/app/app.locator.dart';
import 'package:news_app/app/app.router.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/util/services.dart';
import 'package:news_app/widgets/horizontal_news_tile.dart';
import 'package:news_app/widgets/shimmer_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

class SportsTab extends StatelessWidget {
  final Future future;
  final List<NewsTileModel> newsList;

  SportsTab({this.future, this.newsList});

  @override
  Widget build(BuildContext context) {
    print(newsList.length);
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              var currentItem = newsList[index];
              return HorizontalNewsTile(
                imageURL: currentItem.imageURL,
                publishedAt: currentItem.publishedAt,
                source: currentItem.source,
                title: currentItem.title,
                url: currentItem.url,
                onTap: () {
                  final _navigationService = locator<NavigationService>();
                  _navigationService.navigateTo(Routes.newsPageView);
                  Provider.of<Services>(context, listen: false).url =
                      currentItem.url;
                  Provider.of<Services>(context, listen: false).title =
                      currentItem.title;
                },
              );
            },
          );
        } else
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ShimmerTile(),
          );
      },
    );
  }
}
