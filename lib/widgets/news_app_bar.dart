import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';

class NewsAppBar extends StatelessWidget {
  final Future generateTextColor;
  final String imageURL;
  final String newsTitle;
  final Function onTap;

  NewsAppBar(
      {this.generateTextColor, this.imageURL, this.newsTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: generateTextColor,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: onTap,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu, color: snapshot.data),
                onPressed: () {},
              ),
              shape: RoundedRectangleBorder(borderRadius: kBottomBorderRadius),
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: kBottomBorderRadius,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageURL == null
                        ? AssetImage('assets/placeholder.png')
                        : NetworkImage(imageURL),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text('News Of The Day',
                              style: kMainTextStyle.copyWith(
                                color: snapshot.data,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        newsTitle,
                        style: kMainTextStyle.copyWith(
                          color: snapshot.data,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Learn More',
                              style: kMainTextStyle.copyWith(
                                color: snapshot.data,
                                fontSize: 15,
                              )),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward,
                              size: 30, color: snapshot.data)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else
          return AppBar(
            shape: RoundedRectangleBorder(borderRadius: kBottomBorderRadius),
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: kBottomBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageURL == null
                      ? AssetImage('assets/placeholder.png')
                      : NetworkImage(imageURL),
                ),
              ),
            ),
          );
      },
    );
  }
}
