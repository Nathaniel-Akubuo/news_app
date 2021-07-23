import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(_mediaQuery.height * 0.5),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[400],
          highlightColor: Colors.grey[100],
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: kBottomBorderRadius),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text('Breaking News',
                      style: kMainTextStyle.copyWith(
                          fontSize: 25)),
                  Text('More',
                      style:
                      kMainTextStyle.copyWith(fontSize: 20))
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: _mediaQuery.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            child: Container(
                                width: _mediaQuery.width * 0.6,
                                height:
                                _mediaQuery.height * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        20),
                                    color: Colors.white)),
                            baseColor: Colors.grey[400],
                            highlightColor: Colors.grey[100],
                          ),
                          SizedBox(height: 10),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[400],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(
                                      20)),
                              width: _mediaQuery.width * 0.6,
                              height: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[400],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(
                                      20)),
                              width: _mediaQuery.width * 0.6,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
