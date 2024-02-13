import 'package:flutter/material.dart';
import 'package:food_delivery/views/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 243),
      ),
      home: const BottomNav(),
    );
  }
}


