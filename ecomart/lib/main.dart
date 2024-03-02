import 'package:ecomart/pages/HomeScreen.dart';
import 'package:ecomart/pages/OnboradingScreen.dart';
import 'package:ecomart/pages/auth/LoginPage.dart';
import 'package:ecomart/pages/auth/SignupComponent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecomart',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => OnboardingScreen(), // Route for the onboarding screen
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupComponent()
        // Route for the home screen
      },
    );
  }
}
