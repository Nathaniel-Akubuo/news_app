import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/constants/ui_helpers.dart';
import 'package:news_app/pages/search/search_page_view_model.dart';
import 'package:news_app/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchPageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () {}),
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: kMainPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceRegular,
                      Text(
                        'Discover',
                        style: kMainTextStyle.copyWith(fontSize: 30),
                      ),
                      Text(
                        'News from all over the world',
                        style: kMainTextStyle.copyWith(
                            color: Colors.grey, fontSize: 15),
                      ),
                      verticalSpaceRegular,
                      CustomTextField(
                        controller: model.controller,
                        hintText: 'Search',
                        onSubmitted: () => model.onSubmitted(context),
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SearchPageViewModel());
  }
}
