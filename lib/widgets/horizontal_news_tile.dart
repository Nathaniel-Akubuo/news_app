import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/constants/ui_helpers.dart';

class HorizontalNewsTile extends StatelessWidget {
  final String imageURL;
  final Function onTap;
  final String publishedAt;
  final String source;
  final String title;
  final String url;

  HorizontalNewsTile(
      {this.imageURL, this.publishedAt, this.source, this.title, this.onTap, this.url});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: _mediaQuery.width,
          height: _mediaQuery.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: _mediaQuery.height * 0.1,
                width: _mediaQuery.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/placeholder.png'),
                      image: imageURL == null
                          ? AssetImage('assets/placeholder.png')
                          : NetworkImage(imageURL),
                    ),
                  ),
                ),
              ),
              horizontalSpaceSmall,
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kMainTextStyle.copyWith(fontSize: 13),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(source)),
                        horizontalSpaceMedium,
                        Icon(Icons.circle, size: 6, color: Colors.grey),
                        horizontalSpaceMedium,
                        Icon(Icons.access_time, color: Colors.grey, size: 15),
                        horizontalSpaceTiny,
                        Expanded(child: Text(publishedAt))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
