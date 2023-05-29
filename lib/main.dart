import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:movie/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();;
   await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree()
      
    );
  }
}


