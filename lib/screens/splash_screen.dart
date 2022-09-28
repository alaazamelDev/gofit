import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // set timer to move on to the next page
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // go to home page
        Navigator.pushReplacement(context, WelcomeScreen.route());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              kDumbbellImage,
              color: AppColors.textLight,
              width: MediaQuery.of(context).size.width * .4,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            const SpinKitCircle(
              size: 70,
              color: AppColors.textLight,
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    cacheImages();
    super.didChangeDependencies();
  }

  // load images to cache
  void cacheImages() {
    precacheImage(const AssetImage(kDumbbellImage), context);
    precacheImage(const AssetImage(kWelocomeBg), context);
    precacheImage(const AssetImage(kIntro1Image), context);
    precacheImage(const AssetImage(kIntro2Image), context);
    precacheImage(const AssetImage(kIntro3Image), context);
  }
}
