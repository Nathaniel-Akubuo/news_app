import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onSubmitted;

  CustomTextField({this.controller, this.hintText, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: _mediaQuery.width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.settings_input_component, color: Colors.grey),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey)),
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
