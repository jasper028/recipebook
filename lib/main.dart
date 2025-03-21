import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'welcomepage.dart';  // Import HomePage (which is your WelcomePage)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Recipe Booksg',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: const WelcomePage(),  // Set HomePage (your WelcomePage) as the starting page
    );
  }
}
