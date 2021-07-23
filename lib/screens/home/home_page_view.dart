import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/screens/home/home_page_viewmodel.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/widgets/loading_layout.dart';
import 'package:news_app/widgets/news_app_bar.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Future getHeadlines;
  Future getColors;
  Future getNewsOfTheDay;

  @override
  void initState() {
    var apiHandler = Provider.of<APIHandler>(context, listen: false);
    apiHandler.addItems();
    getHeadlines = apiHandler.getHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return ViewModelBuilder<HomePageViewModel>.nonReactive(
        builder: (context, model, child) =>
            Consumer<APIHandler>(builder: (context, child, apiHandler) {
              var apiHandler = Provider.of<APIHandler>(context, listen: false);
              return FutureBuilder(
                future: getHeadlines,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      bottomNavigationBar: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.white,
                        unselectedItemColor: Colors.black,
                        selectedItemColor: Colors.black,
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home, size: 30), label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.search, size: 30), label: ''),
                          BottomNavigationBarItem(
                              icon:
                                  Icon(Icons.person_outline_rounded, size: 30),
                              label: '')
                        ],
                      ),
                      appBar: PreferredSize(
                        preferredSize:
                            Size.fromHeight(_mediaQuery.height * 0.5),
                        child: FutureBuilder(
                          future: model.setNewsOfTheDay(context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return NewsAppBar(
                                generateTextColor:
                                    model.generateTextColor(context),
                                imageURL: model.newsOfTheDay.imageURL,
                                newsTitle: model.newsOfTheDay.title,
                                onTap: () => model.navigateToNewsPage(
                                    context: context,
                                    title: model.newsOfTheDay.title,
                                    url: model.newsOfTheDay.url),
                              );
                            } else
                              return PreferredSize(
                                preferredSize:
                                    Size.fromHeight(_mediaQuery.height * 0.5),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey[100],
                                  child: AppBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: kBottomBorderRadius),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              );
                          },
                        ),
                      ),
                      body: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Breaking News',
                                    style: kMainTextStyle.copyWith(
                                        fontSize: 25)),
                                Text('More',
                                    style: kMainTextStyle.copyWith(
                                        fontSize: 20))
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: _mediaQuery.height * 0.25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: apiHandler.newsList.length,
                                itemBuilder: (context, index) {
                                  var currentItem =
                                      apiHandler.newsList[index];
                                  return NewsTile(
                                    title: currentItem.title,
                                    imageURL: currentItem.imageURL,
                                    onTap: () => model.navigateToNewsPage(
                                        title: currentItem.title,
                                        url: currentItem.url,
                                        context: context),
                                    publishedAt: currentItem.publishedAt,
                                    source: currentItem.source,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return LoadingLayout();
                  }
                },
              );
            }),
        viewModelBuilder: () => HomePageViewModel());
  }
}
