import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/screens/home/home_page_viewmodel.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

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
    return ViewModelBuilder<HomePageViewModel>.reactive(
        builder: (context, model, child) =>
            Consumer<APIHandler>(builder: (context, child, apiHandler) {
              var apiHandler = Provider.of<APIHandler>(context, listen: false);
              return FutureBuilder(
                future: apiHandler.getHeadlines(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Scaffold(
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
                              icon:
                                  Icon(Icons.person_outline_rounded, size: 30),
                              label: '')
                        ],
                      ),
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(mediaQuery.height * 0.4),
                        child: Container(
                          child: FlexibleSpaceBar(
                            title: Text(model.getNews(context).title,
                                style: mainTextStyle.copyWith(fontSize: 12)),
                            background: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30)),
                              child: FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder:
                                      AssetImage('assets/placeholder.png'),
                                  image: NetworkImage(
                                      model.getNews(context).imageURL)),
                            ),
                          ),
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
                    );
                  } else {
                    return Scaffold(body: Center(child: CircularProgressIndicator()));
                  }
                },
              );
            }),
        viewModelBuilder: () => HomePageViewModel());
  }
}
//FutureBuilder(
//future: apiHandler.getHeadlines(),
//builder:
//(BuildContext context, AsyncSnapshot snapshot) {
//if (snapshot.data != null) {
//return FlexibleSpaceBar(
//title: Text(
//model.getNews(context).title,
//style: TextStyle(fontSize: 12),
//),
//background: ClipRRect(
//borderRadius: BorderRadius.vertical(
//bottom: Radius.circular(30)),
//child: FadeInImage(
//fit: BoxFit.cover,
//placeholder:
//AssetImage('assets/placeholder.png'),
//image: NetworkImage(
//model.getNews(context).imageURL)),
//),
//);
//} else {
//return Center(
//child: CircularProgressIndicator(
//backgroundColor: Colors.white,
//),
//);
//}
//},
//),
