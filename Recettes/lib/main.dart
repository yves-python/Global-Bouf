// ignore_for_file: await_only_futures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette/OnBeard.dart';
import 'package:recette/Screen/HomeScreen.dart';
import 'package:recette/Screen/LoginPage.dart';
import 'package:recette/Screen/RegistrationPage.dart';
import 'package:recette/authentificationWrapper.dart';
import 'package:recette/constant.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recette/services/authentification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) {
          return Authentification();
        }),
        StreamProvider(
          create: (context) {
            return context.read<Authentification>().users;
          },
          initialData: null,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: "Lato"),
          home: OnBearScreen(),
          // home: const HomeScreen(),
          routes: {
            "/login": (context) => LoginPage(),
            "/register": (context) => RegistrationPage(),
            "/authWrapper": (context) => AuthentificationWrapper(),
          }),
    );
  }
}
