// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:glover_t7_v2/u.dart';

class CustomTextField extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black), 
    ),
    child: TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 15), 
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent), 
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent), 
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  ),
);
;
  }
}
