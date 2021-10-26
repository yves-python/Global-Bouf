// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:recette/Screen/RegistrationPage.dart';
import 'package:recette/constant.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:recette/models/widget.dart';
import 'package:recette/services/authentification.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

   String email = '';
   String password = '';

  Authentification auth = Authentification();

  bool first = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: SingleChildScrollView(
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
                  child: Row(
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
              Text(
                first? "Bienvenue":
                "Salut",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  color: kLightFontColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                first? " " :"Connectez-vous à votre compte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: kDarkGreyFontColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Form(
                // key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: kLightFontColor),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        autofocus: false,
                        // validator: validateEmail,
                        
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: buildInputDecoration(
                          'Enter Email',
                          Icons.email,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
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
                        autofocus: false,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                          else if (value.length < 6) {
                            return " mot de passe trop cour";
                          }
                        },
                        
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: buildInputDecoration(
                            'Enter Password', Icons.lock),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      // mon boutton
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () async{
                              print("$email   $password");
                              var result = first
                              ? await auth.inscription_Email_Pw(email, password)
                              : await auth.connection_Email_Pw(email, password);

                              if ( result == null) {
                                print("erreur");
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
                                )
                            ),
                            child: Text(
                              first? "S'inscrire " : "Se Connecter",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: kDarkColor,
                              
                              ),
                            ),
                          ),
                        ),
                          SizedBox(height: 16.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(first? "Vous Avez Deja Un Compte ?" : "Vous N'avez Pas De Compte ?   ", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900, color:kLightFontColor,),),
                          GestureDetector(
                            onTap:  () {
                              setState(() {
                              first = !first;
                            });
                            },
                        child: Text(
                         first? "Se Connecter" : "  S'inscrire!",style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900, color:kPrimaryColor,),
                        ),
                      ),
                          ],),
                          

                      // auth.loggedInStatus == Status.Authenticating
                      // ?loading
                      // : longButtons('Login',doLogin),
                      // SizedBox(height: 8.0,),
                      // forgotLabel
                    ],
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
