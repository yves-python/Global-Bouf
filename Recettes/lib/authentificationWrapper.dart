// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:recette/Screen/HomeScreen.dart';
import 'package:recette/Screen/LoginRegistrationPage.dart';

class AuthentificationWrapper extends StatelessWidget {
  const AuthentificationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res = context.watch<User?>();
    Navigator.maybePop(context);
    return res != null ? HomeScreen(user: res) : LogRegistrePage();
  }
}

// pour gerer le stream
