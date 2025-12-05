import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FunChatApp());
}

class FunChatApp extends StatelessWidget {
  const FunChatApp({super.key}); // Use super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funchat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(), 
    );
  }
}
