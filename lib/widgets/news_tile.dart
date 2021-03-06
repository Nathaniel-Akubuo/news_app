import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';

class NewsTile extends StatelessWidget {
  final imageURL;
  final publishedAt;
  final source;
  final title;
  final Function onTap;

  NewsTile(
      {this.imageURL, this.publishedAt, this.onTap, this.title, this.source});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(
          width: mediaQuery.width * 0.6,
          height: mediaQuery.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: kCircularBorderRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: mediaQuery.width * 0.6,
                  height: mediaQuery.height * 0.15,
                  child: ClipRRect(
                      borderRadius: kCircularBorderRadius,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: FadeInImage(
                          placeholder: AssetImage('assets/placeholder.png'),
                          image: imageURL == null
                              ? AssetImage('assets/placeholder.png')
                              : NetworkImage(imageURL),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/placeholder.png',
                                fit: BoxFit.cover);
                          },
                        ),
                      ))),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: kMainTextStyle.copyWith(fontSize: 13),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(publishedAt,
                    style: kMainTextStyle.copyWith(
                        fontSize: 12, color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(source,
                    style: kMainTextStyle.copyWith(
                        color: Colors.grey, fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
