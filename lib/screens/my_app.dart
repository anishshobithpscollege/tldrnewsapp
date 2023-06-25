import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tldr/screens/about.dart';
import 'package:tldr/widgets/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TLDR News App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
