import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/constants/ui_helpers.dart';
import 'package:news_app/pages/search/business_tab.dart';
import 'package:news_app/pages/search/science_tab.dart';
import 'package:news_app/pages/search/search_page_view_model.dart';
import 'package:news_app/pages/search/sports_tab.dart';
import 'package:news_app/pages/search/technology_tab.dart';
import 'package:news_app/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'entertainment_tab.dart';
import 'health_tab.dart';

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
              body: DefaultTabController(
                length: 6,
                initialIndex: 0,
                child: Builder(
                  builder: (context) => Padding(
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
                          onSubmitted: (value) => model.onSubmitted(context),
                          onPressed: () => model.onSubmitted(context),
                        ),
                        verticalSpaceRegular,
                        TabBar(
                            indicatorColor: Colors.black,
                            indicatorWeight: 3,
                            labelStyle: kMainTextStyle,
                            unselectedLabelStyle: kMainTextStyle,
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.black,
                            isScrollable: true,
                            tabs: [
                              Tab(text: 'Business'),
                              Tab(text: 'Entertainment'),
                              Tab(text: 'Health'),
                              Tab(text: 'Science'),
                              Tab(text: 'Sports'),
                              Tab(text: 'Technology'),
                            ]),
                        Flexible(
                          child: TabBarView(children: [
                            BusinessTab(
                              future: model.getBusinessNews(context),
                              newsList: model.businessNewsList,
                            ),
                            EntertainmentTab(
                              future: model.getEntertainmentNews(context),
                              newsList: model.entertainmentNewsList,
                            ),
                            HealthTab(
                              future: model.getHealthNews(context),
                              newsList: model.healthNewsList,
                            ),
                            ScienceTab(
                              future: model.getScienceNews(context),
                              newsList: model.scienceNewsList,
                            ),
                            SportsTab(
                              future: model.getSportsNews(context),
                              newsList: model.sportsNewsList,
                            ),
                            TechnologyTab(
                              future: model.getTechnologyNews(context),
                              newsList: model.technologyNewsList,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SearchPageViewModel());
  }
}
