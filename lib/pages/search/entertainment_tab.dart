import 'package:flutter/material.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/widgets/horizontal_news_tile.dart';
import 'package:news_app/widgets/shimmer_tile.dart';

class EntertainmentTab extends StatelessWidget {
  final Future future;
  final List<NewsTileModel> newsList;
  final Function onTap;

  EntertainmentTab({this.future, this.newsList, this.onTap});
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
                onTap: onTap,
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
