import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  // route builder
  static Route route() => MaterialPageRoute(
        builder: ((context) => const WelcomeScreen()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            kWelocomeBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Gradient Box
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.grey.shade900,
                  Colors.black12,
                ],
              ),
            ),
          ),
          // Text
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 2,
              vertical: defaultPadding * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Welcome to 👋',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: defaultPadding * 0.25),
                Text(
                  'Gofit',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 96,
                      ),
                ),
                const SizedBox(height: defaultPadding * 0.25),
                Text(
                  'The best fitness app in this century to\naccompany your sports',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
