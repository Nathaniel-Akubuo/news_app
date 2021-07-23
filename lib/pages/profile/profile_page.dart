import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/pages/profile/profile_page_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Text(
                  'Coming Soon',
                  style: kMainTextStyle.copyWith(fontSize: 30),
                ),
              ),
            ),
        viewModelBuilder: () => ProfilePageViewModel());
  }
}
