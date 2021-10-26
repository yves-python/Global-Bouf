// ignore_for_file: empty_statements, dead_code, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SearchPages extends StatefulWidget {
  SearchPages({Key? key}) : super(key: key);

  @override
  _SearchPagesState createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(" Pages de recherche"),
      ),
    );;
  }
}