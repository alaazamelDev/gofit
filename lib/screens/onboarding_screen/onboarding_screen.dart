import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => OnBoardingScreen()),
      );

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final List<Map> _introSlides = [
    {
      "image": kIntro1Image,
      "description": "Find the right workout for what you need",
    },
    {
      "image": kIntro2Image,
      "description": "Make suitable workouts and great results",
    },
    {
      "image": kIntro3Image,
      "description": "Let's do a workout and live healthy with us",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
          valueListenable: pageIndex,
          builder: (context, index, _) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    _introSlides[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2,
                      vertical: defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _introSlides[index]['description'],
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < _introSlides.length; i++) ...[
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: index == i ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (index < _introSlides.length - 1) {
                                pageIndex.value = index + 1;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding,
                              ),
                              child: Text(
                                'NEXT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textLight),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
