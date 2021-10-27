// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:recette/constant.dart';
import 'package:recette/models/widget.dart';
import 'package:recette/services/authentification.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  String? error = "";
  String userName = "";
  String password = "";
  String email = "";
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: load
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55.0, left: 32.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_back_ios,
                                    size: 24.0, color: kLightFontColor),
                                Text(
                                  "Retour",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800,
                                    color: kLightFontColor,
                                  ),
                                )
                              ],
                            ),
                            // Positioned(
                            //   top: -140.0,
                            //   right: -160.0,
                            //   child: Image.asset(
                            //     "assets/images/forme.png",
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    Container(
                      height: 180.0,
                      width: 180.0,
                      child: Image.asset(
                        "assets/images/logo1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Creez votre compte ici",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kLightFontColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Nom",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                  color: kLightFontColor,
                                ),
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    userName = value;
                                  });
                                },
                                autofocus: false,
                                decoration: buildInputDecoration(
                                    "Votre Nom", Icons.person),
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                  color: kLightFontColor,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                autofocus: false,
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "email vide";
                                  }
                                },
                                decoration: buildInputDecoration(
                                  'Enter Email',
                                  Icons.email,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: kLightFontColor),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                autofocus: false,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.length < 6) {
                                    return "trop court";
                                  }
                                },
                                decoration: buildInputDecoration(
                                  'Enter Password',
                                  Icons.lock,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                error!,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // mon boutton
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      load = true;
                                    });
                                    final result = await context
                                        .read<Authentification>()
                                        .inscription_Email_Pw(
                                          email,
                                          password,
                                        );

                                    if (result != null) {
                                      Navigator.pushReplacementNamed(
                                          context, "/authWrapper");
                                    } else {
                                      load = false;
                                      error = "une erreur est survenue";
                                    }
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32.0),
                                        bottomLeft: Radius.circular(32.0),
                                        bottomRight: Radius.circular(32.0),
                                      )),
                                  child: Text(
                                    "S'inscrire",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      color: kDarkColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vous Avez Deja Un Compte ?   ",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w900,
                                      color: kLightFontColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        "/login",
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      //padding  mis pour agrandir le text
                                      child: Text(
                                        "  Se Connecter",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w900,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // auth.loggedInStatus == Status.Authenticating
                              // ?loading
                              // : longButtons('Login',doLogin),
                              // SizedBox(height: 8.0,),
                              // forgotLabel
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
