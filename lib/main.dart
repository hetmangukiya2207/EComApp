import 'package:ecomapp/module/Views/HomePage/views/HomePage.dart';
import 'package:ecomapp/module/Views/IntroScreen/views/IntroScreen.dart';
import 'package:ecomapp/module/Views/LogInPage/views/LogInPage.dart';
import 'package:ecomapp/module/Views/SignupPage/views/SignupPage.dart';
import 'package:flutter/material.dart';
import 'module/Views/SplashScreen/SplashScreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'IntroScreen': (context) => const IntroScreen(),
        'SignupPage': (context) => SignupPage(),
        'LogInPage': (context) => LogInPage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}