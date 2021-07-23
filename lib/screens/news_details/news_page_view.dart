import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/screens/news_details/news_page_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsPageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => model.close(),
                ),
                title: Text(model.getTitle(context),
                    style: kMainTextStyle),
                backgroundColor: Colors.white,
              ),
              body: WebView(
                initialUrl: model.getUrl(context),
                javascriptMode: JavascriptMode.unrestricted
              ),
            ),
        viewModelBuilder: () => NewsPageViewModel());
  }
}
