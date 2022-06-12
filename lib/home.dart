import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    debugPrint("INIT STATE INITIALIZED!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text("HOME SCREEN 🏚️",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
