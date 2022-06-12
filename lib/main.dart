import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(KellarEatsApp());
}

class KellarEatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KellarEats 🧑‍🍳👩‍🍳',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: Colors.deepOrangeAccent),
      home: HomeScreen(),
    );
  }
}
