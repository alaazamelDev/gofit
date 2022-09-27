import 'package:flutter/material.dart';
import 'package:gofit/config/theme_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

// route builder
  static Route route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoFit"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Switch Mode'),
          onPressed: () {
            final themeNotifier = context.read<ThemeNotifier>();
            if (themeNotifier.getTheme() == ThemeNotifier.darkTheme) {
              themeNotifier.setLightMode();
            } else {
              themeNotifier.setDarkMode();
            }
          },
        ),
      ),
    );
  }
}
