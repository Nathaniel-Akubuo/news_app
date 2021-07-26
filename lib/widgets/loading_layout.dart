import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/widgets/shimmer_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class LoadingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ShimmerAppBar(height: _mediaQuery.height*0.5),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
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
              SizedBox(height: 10),
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
                              height: 20,
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
                              height: 20,
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
