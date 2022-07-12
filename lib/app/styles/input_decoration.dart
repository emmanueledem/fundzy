import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/colors.dart';

const kinputdecorationStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: AppColors.primaryColor,
    fontFamily: 'poppins',
    fontSize: 15,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 8.0,
  ),
  // border: OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(13.0)),
  // ),
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(13.0)),
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
  //   borderRadius: BorderRadius.all(Radius.circular(13.0)),
  // ),
  // errorBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.red, width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(13.0)),
  // ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  ),

  labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'poppins',
    fontSize: 16,
  ),
);
