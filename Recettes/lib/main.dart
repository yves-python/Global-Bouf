// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:recette/OnBeard.dart';
import 'package:recette/Screen/HomeScreen.dart';
import 'package:recette/constant.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: "Lato"
      ),
      home: const HomeScreen(),
    );
  }
}
