// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:recette/constant.dart';



class SettingPages extends StatefulWidget {
  const SettingPages({Key? key}) : super(key: key);

  @override
  _SettingPagesState createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {

  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  OnChangeFunction1 (bool newvalue1) {
    setState(() {
      valNotify1 = newvalue1;
    },
   );
  } 
  OnChangeFunction2 (bool newvalue2) {
    setState(() {
      valNotify2 = newvalue2;
    },
   );
  }
   OnChangeFunction3 (bool newvalue3) {
    setState(() {
      valNotify3 = newvalue3;
    },
   );
  }
  
  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: kDarkColor,
        title: Text(
        "Parametre",
        style: TextStyle(fontSize: 22.0),
       ),
       leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      ),
      body:  Container(
        color: kDarkColor,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40.0,),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFFFFc20d),
                ),
                SizedBox(width: 10,),
                Text(
                  "Compte",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: kLightFontColor,
                    ),
                ) 
              ],
            ),
            Divider(
              height: 30,
              thickness: 3,
              color: kLightgreyColor,
            ),
            SizedBox(height: 10,),
            buildAcountOption(context, "Changer Mot De Passe"),
            buildAcountOption(context, "Contenue De Parametre"),
            buildAcountOption(context, "Social"),
            buildAcountOption(context, "langue"),
            buildAcountOption(context, "Politique Et Securite"),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Color(0xFFFFc20d),
                ),
                SizedBox(width: 10,),
                Text(
                  "Notifiaction",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: kLightFontColor,
                  ),
                ),
                
              ],
            ),
            Divider(
              height: 30,
              thickness: 3,
              color: kLightgreyColor,
            ),
            SizedBox(height: 10,),
            builNotificationOption("Mode Claire/Dark", valNotify1,OnChangeFunction1),
            builNotificationOption("Activer Compte", valNotify2,OnChangeFunction2),
            builNotificationOption("Oppotunite", valNotify3,OnChangeFunction3),
            SizedBox(height: 35,),
            Center(
              child: OutlinedButton(
                style:  OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color(0xFFFFc20d),
                ),
                onPressed: () {},
                child: Text(
                  "Deconnexion",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }

  Padding builNotificationOption(String title , bool value, Function onChangeMethode) {
      return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kLightgreyfontColor.withOpacity(0.9),
            ),
          ),

          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0xFFFFc20d),
              trackColor: Color(0xFFF3F3F3).withOpacity(0.5),
              value: value, 
              onChanged: (bool newvalue) { 
                onChangeMethode(newvalue);
               },
            ),
          ),
      ],
     ),
    );
  }
  GestureDetector buildAcountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("option1"),
                Text("option1"),
              ],
            ),
            actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("fermer"),
                    ),
                  ]
          );
        }
       );
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 28,
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kLightgreyfontColor.withOpacity(0.9),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFC6C5C5),
            ),
            ],
          ),
        ),
    ) ;
  }
  
  
}