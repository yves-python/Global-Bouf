// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, void_checks, no_logic_in_create_state

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recette/Screen/ContentBottomNavigation/BodyPages.dart';

import 'package:recette/Screen/ContentBottomNavigation/MenuPage.dart';
import 'package:recette/Screen/ContentBottomNavigation/Recherche.dart';
import 'package:recette/Screen/ContentBottomNavigation/SettingPages.dart';
import 'package:recette/constant.dart';
import 'package:http/http.dart' as https;

class Categories {
  String? imagesCategori;
  String? nomCategorie;

  Categories({this.imagesCategori, this.nomCategorie});
}

class Meals {
  String? imageMeals;
  String? nomMeals;
  String? idMeal;
  String? time = "10";
  String? lvl = "moyen";

  Meals({this.idMeal, this.imageMeals, this.nomMeals, this.lvl, this.time});
}

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentIndex = 0;
  // String currentCategories = "Beef";
  // List<Categories> categorieList = [];
  // List<Meals> dinnerList =[];
  // bool? chargement;

  final List bottomNavigationPage = [
    Body(
      user: FirebaseAuth.instance.currentUser,
    ),
    SearchPages(),
    MenuPage(),
    SettingPages(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user); // les informations de l'utlisateur connecter
    return Scaffold(
      backgroundColor: kDarkColor,
      bottomNavigationBar: Container(
        height: 74.0,
        // padding: const EdgeInsets.only(top: 5),
        child: BottomNavigationBar(
            backgroundColor: kBottomColor.withOpacity(.1),
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kDarkGreyFontColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BuildBottomNavigationBarItem('assets/icons/acceuil.png', 0),
              BuildBottomNavigationBarItem('assets/icons/recherche.png', 1),
              BuildBottomNavigationBarItem('assets/icons/menu.png', 2),
              BuildBottomNavigationBarItem('assets/icons/paramètres.png', 3),
            ]),
      ),
      body: IndexedStack(
          index: selectedIndex, children: <Widget>[...bottomNavigationPage]),
    );
  }

  BottomNavigationBarItem BuildBottomNavigationBarItem(
      String image, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(image),
              size: 21.0,
            ),
            Container(
              height: 8.0,
              width: 8.0,
              margin: EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? kPrimaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
            )
          ],
        ),
      ),
      label: "",
    );
  }
}
