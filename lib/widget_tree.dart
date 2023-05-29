import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie/auth.dart';

import 'package:movie/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/login_register_page.dart';
class WidgetTree extends StatefulWidget {
  const WidgetTree({ Key? key }) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        if(snapshot.hasData
        ){
          return HomePage();
        }
        else{
          return LoginRegisterPage();
        }
      },
      
    );
  }
}
