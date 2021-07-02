import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/screens/home/home_page_viewmodel.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    var apiHandler = Provider.of<APIHandler>(context, listen: false);
    apiHandler.getNewsOfTheDay();
    apiHandler.addItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return ViewModelBuilder<HomePageViewModel>.nonReactive(
        builder: (context, model, child) =>
            Consumer<APIHandler>(builder: (context, child, apiHandler) {
              var apiHandler = Provider.of<APIHandler>(context, listen: false);
              return FutureBuilder(
                future: apiHandler.getHeadlines(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return SafeArea(
                      child: Scaffold(
                        backgroundColor: Colors.white,
                        bottomNavigationBar: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          elevation: 0,
                          backgroundColor: Colors.white,
                          unselectedItemColor: Colors.black,
                          selectedItemColor: Colors.black,
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home, size: 30), label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.search, size: 30), label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.person_outline_rounded,
                                    size: 30),
                                label: '')
                          ],
                        ),
                        appBar: PreferredSize(
                          preferredSize:
                          Size.fromHeight(mediaQuery.height * 0.5),
                          child: AppBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: bottomBorderRadius),
                            flexibleSpace: Container(
                                height: mediaQuery.height * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: bottomBorderRadius,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:NetworkImage(
                                            model.getNews(context).imageURL))),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white38,
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text('News Of The Day', style: mainTextStyle.copyWith(fontSize: 12)),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        model.getNews(context).title,
                                        style: mainTextStyle.copyWith(
                                            fontSize: 12),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text('Learn More',
                                              style: mainTextStyle.copyWith(
                                                  fontSize: 12)),
                                          SizedBox(width: 10),
                                          Icon(Icons.arrow_forward)
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        body: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Breaking News',
                                          style: mainTextStyle.copyWith(
                                              fontSize: 20)),
                                      Text('More',
                                          style: mainTextStyle.copyWith(
                                              fontSize: 15))
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: mediaQuery.height * 0.35,
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
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SafeArea(
                      child: Scaffold(
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/9419-loading-circles.json'),
                            Text('Loading...', style: mainTextStyle)
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            }),
        viewModelBuilder: () => HomePageViewModel());
  }
}
