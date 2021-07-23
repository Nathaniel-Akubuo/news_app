import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_tile_model.dart';
import 'package:news_app/util/api_handler.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class SearchPageViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  List<NewsTileModel> searchResults = [];

  void onSubmitted(context) async {
    var apiHandler = Provider.of<APIHandler>(context, listen: false);
    await apiHandler.searchKeyword(controller.text);
  }
}
