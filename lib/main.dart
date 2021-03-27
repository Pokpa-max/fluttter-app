
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/recherche.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My_home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       visualDensity: VisualDensity.adaptivePlatformDensity,
       textTheme:GoogleFonts.openSansTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home:Recherche()
    );
  }
}

