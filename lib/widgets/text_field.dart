import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  const CommonTextField(
      {Key key,  this.controller,  this.hint, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFEEEEEE))),
        hintText: hint,
      ),
    ).container(padding: const EdgeInsets.only(top: 25));
  }
}
