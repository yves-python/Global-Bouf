// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:recette/Screen/LoginPage.dart';
import 'package:recette/Screen/RegistrationPage.dart';
import 'package:recette/constant.dart';

class LogRegistrePage extends StatefulWidget {
  LogRegistrePage({
    Key? key,
  }) : super(key: key);

  @override
  _LogRegistrePageState createState() => _LogRegistrePageState();
}

class _LogRegistrePageState extends State<LogRegistrePage> {
  bool first = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          // buildRetour(context),
          SizedBox(
            height: 60,
          ),
          SizedBox(height: 150.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/timelogRegistre.png",
                height: 200,
                width: 200,
              ),
            ],
          ),
          SizedBox(height: 80.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ),
                  );
                },
                child: FlateButton(
                  contenu: Text(
                    "S'inscrire",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kLightFontColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: FlateButton(
                  contenu: Text(
                    "Se Connecter",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kLightFontColor),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding buildRetour(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0, left: 32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 24.0,
              color: kDarkColor,
            ),
            Text(
              "Retour",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                color: kDarkColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FlateButton extends StatelessWidget {
  const FlateButton({Key? key, this.contenu}) : super(key: key);
  final Widget? contenu;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: null,
      child: Container(
        alignment: Alignment.center,
        height: 60.0,
        width: 145.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: kDarkColor.withOpacity(0.7)),
        child: contenu,
      ),
    );
  }
}
