// ignore_for_file: prefer_const_constructors, prefer_equal_for_default_values

import 'package:flutter/material.dart';
import 'package:recette/constant.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color(0xFFFFc20d)),
     hintText: hintText,
     hintStyle: TextStyle(fontSize: 13.0, color: kLightFontColor),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: UnderlineInputBorder(borderSide: BorderSide(color: kLightFontColor)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kDarkColor),borderRadius: BorderRadius.circular(25.0)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(25.0)),
    filled: true,
    fillColor: kDarkgreyColor,
    
  );
}


MaterialButton ongButtonsl(String title, final VoidCallback? fun,
    {Color color: Colors.blue, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: Color(0xFF272727),
    color: Color(0xFFFFc20d),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

