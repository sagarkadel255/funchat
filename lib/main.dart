import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FunChatApp());
}

class FunChatApp extends StatelessWidget {
  const FunChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funchat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //  Global Font
        fontFamily: 'OpenSans',

        //  App Colors
        primaryColor: const Color(0xFF667EEA),
        scaffoldBackgroundColor: const Color(0xFF81EEFF),

        //  Text Theme (Professional)
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
        ),

        //  Button Theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF5DA5ED),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
