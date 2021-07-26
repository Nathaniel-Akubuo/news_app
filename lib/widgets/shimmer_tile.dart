import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:news_app/constants/ui_helpers.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
      child: Container(
        width: _mediaQuery.width,
        height: _mediaQuery.height * 0.1,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.grey[100],
              child: Container(
                height: _mediaQuery.height * 0.1,
                width: _mediaQuery.width * 0.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: kCircularBorderRadius),
              ),
            ),
            horizontalSpaceSmall,
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: _mediaQuery.width,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: kCircularBorderRadius),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      width: _mediaQuery.width,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: kCircularBorderRadius),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
