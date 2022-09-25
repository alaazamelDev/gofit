import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

// route builder
  static Route route() => MaterialPageRoute(
        builder: ((context) => const HomeScreen()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
