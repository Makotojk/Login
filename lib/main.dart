import 'package:flutter/material.dart';
import 'package:flutter_application_login/pages/starter_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flutter',
      debugShowCheckedModeBanner: false,
      home: StarterPage(),
        
        );     
  }
}