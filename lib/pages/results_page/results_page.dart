import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/pages/results_page/results_page_view_model.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:news_app/util/services.dart';
import 'package:news_app/widgets/horizontal_news_tile.dart';
import 'package:news_app/widgets/shimmer_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Future future;

  @override
  void initState() {
    print(Provider.of<Services>(context, listen: false).keyword);
    future = Provider.of<APIHandler>(context, listen: false).searchKeyword(
        keyword: Provider.of<Services>(context, listen: false).keyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var apiHandler = Provider.of<APIHandler>(context, listen: true);
    return ViewModelBuilder<ResultsPageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(model.title(context), style: kMainTextStyle),
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: model.close,
                ),
              ),
              backgroundColor: Colors.white,
              body: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: apiHandler.searchResults.length,
                      itemBuilder: (context, index) {
                        var currentNewsItem = apiHandler.searchResults[index];
                        return HorizontalNewsTile(
                          imageURL: currentNewsItem.imageURL,
                          onTap: () => model.navigateToNewsPage(
                              context: context,
                              title: currentNewsItem.title,
                              url: currentNewsItem.url),
                          publishedAt: currentNewsItem.publishedAt,
                          source: currentNewsItem.source,
                          title: currentNewsItem.title,
                          url: currentNewsItem.url,
                        );
                      },
                    );
                  } else
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => ShimmerTile());
                },
              ),
            ),
        viewModelBuilder: () => ResultsPageViewModel());
  }
}
