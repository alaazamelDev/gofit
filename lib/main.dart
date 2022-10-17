import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          Brightness statusBarIconsBrightness;
          if (themeNotifier.getTheme() == ThemeNotifier.lightTheme) {
            statusBarIconsBrightness = Brightness.dark;
          } else {
            statusBarIconsBrightness = Brightness.light;
          }
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: statusBarIconsBrightness,
            ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: themeNotifier.getTheme(),
            theme: ThemeNotifier.lightTheme,
            darkTheme: ThemeNotifier.darkTheme,
            themeMode: ThemeMode.system,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
