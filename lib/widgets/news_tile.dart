import 'package:flutter/cupertino.dart';
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: mediaQuery.width * 0.6,
                  height: mediaQuery.height * 0.15,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
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
                  style: mainTextStyle.copyWith(fontSize: 13),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(publishedAt,
                    style: mainTextStyle.copyWith(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(source,
                    style: mainTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
