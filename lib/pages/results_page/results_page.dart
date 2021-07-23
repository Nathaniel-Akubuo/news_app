import 'package:flutter/material.dart';
import 'package:news_app/pages/results_page/results_page_view_model.dart';
import 'package:stacked/stacked.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResultsPageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => ResultsPageViewModel());
  }
}
