import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  ShimmerAppBar({this.height});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400],
        highlightColor: Colors.grey[100],
        child: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: kBottomBorderRadius),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
