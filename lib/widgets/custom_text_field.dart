import 'package:flutter/material.dart';
import 'package:news_app/constants/contants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onPressed;
  final Function onSubmitted;

  CustomTextField(
      {this.controller, this.hintText, this.onPressed, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: _mediaQuery.width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: kCircularBorderRadius),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.grey),
                  onPressed: onPressed),
              suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: controller.clear),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey)),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
