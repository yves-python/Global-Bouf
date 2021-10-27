// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:recette/Screen/HomeScreen.dart';
import 'package:recette/Screen/LoginPage.dart';
import 'package:recette/Screen/LoginRegistrationPage.dart';
import 'package:recette/constant.dart';
import 'package:recette/models/ClassOnBeard.dart';

class OnBearScreen extends StatefulWidget {
  const OnBearScreen({Key? key}) : super(key: key);

  @override
  _OnBearScreenState createState() => _OnBearScreenState();
}

class _OnBearScreenState extends State<OnBearScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 84.0,
                left: 52.0,
                child: Image.asset("assets/images/smallDot.png"),
              ),
              Positioned(
                bottom: 32.0,
                left: 84.0,
                child: Image.asset("assets/images/mediumDot.png"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/bigDot.png",
                  height: 430,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/beardGround.png",
                  scale: 0.6,
                ),
              ),
              Positioned(
                // MEC TON TRUCK NE MARCHAIT PAS SUR MON LALE DONC J'AI DU REPOSITIONNER(c'etait trop en bas il y avait erreur RenderFlex overflowed )
                // donc c'est pas bien placer faut revoir xa
                // bottom: 10,
                child: Container(
                  height: 265.0,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 32, right: 32, bottom: 25),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      color: kDarkColor,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onbeardList.length,
                                (index) => builDot(index, context),
                              )),
                        ),
                        SizedBox(height: 18.0),
                        Container(
                          width: double.infinity,
                          height: 80.0,
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: onbeardList.length,
                            onPageChanged: (int index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Text(
                                  onbeardList[index].title!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: kLightFontColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 24.0),
                              ]);
                            },
                          ),
                        ),
                        Text(
                          'plus de confusion sur  votre \n menu de repas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 28.0),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex == onbeardList.length - 1) {
                              Navigator.pushReplacementNamed(
                                  context, "/authWrapper");
                            }
                            _controller!.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          child: Container(
                            height: 50,
                            width: 230.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 5.0,
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    currentIndex == onbeardList.length - 1
                                        ? "continu"
                                        : "suivant",
                                    style: TextStyle(
                                      color: kDarkColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    )),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20),
                                //   child: Image.asset('assets/icons/arrow.png'),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container builDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      height: 15.0,
      width: currentIndex == index ? 30 : 10,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
    );
  }
}
