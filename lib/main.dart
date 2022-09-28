import 'package:flutter/material.dart';
import 'package:gofit/config/theme_data.dart';
import 'package:gofit/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ThemeNotifier()),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeNotifier.lightTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
