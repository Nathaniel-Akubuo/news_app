import 'package:news_app/app/app.locator.dart';
import 'package:news_app/util/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResultsPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void close() => _navigationService.back();

  String title(context) {
    return Provider.of<Services>(context, listen: false).keyword;
  }


}
