import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/TaskDetail/DetailScreen.dart';

import 'model/NavItems.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return ChangeNotifierProvider(
            create: (context) => NavItems(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TAB App',
              theme: ThemeData(
                // backgroundColor: Colors.white,
                scaffoldBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: DetailScreen(), // For login page change to LoginScreen()
            ),
          );
        });
  }
  
}
