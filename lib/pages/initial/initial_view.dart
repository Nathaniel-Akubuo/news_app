import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'initial_view_model.dart';

class InitialPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitialViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.black,
                currentIndex: model.currentIndex,
                onTap: (index) => model.setIndex(index),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 30),
                      label: 'Home',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search, size: 30),
                      label: 'Search',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_rounded, size: 30),
                      label: 'Profile',
                      backgroundColor: Colors.white)
                ],
              ),
              body: IndexedStack(
                index: model.currentIndex,
                children: model.pages,
              ),
            ),
        viewModelBuilder: () => InitialViewModel());
  }
}
