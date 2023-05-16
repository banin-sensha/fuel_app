import 'package:flutter/material.dart';
import 'package:fuel/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}
