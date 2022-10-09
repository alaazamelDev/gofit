import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightFragment extends StatelessWidget {
  HeightFragment({Key? key}) : super(key: key);

  final ValueNotifier<int> selectedHeight = ValueNotifier(170);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: defaultPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What is Your Height?',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  'Height in cm, Don\'t worry, you can always change it later.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // vertical: defaultPadding * 1.5,
                horizontal: defaultPadding,
              ),
              child: Center(
                child: SizedBox(
                  height: 350,
                  child: ValueListenableBuilder<int>(
                    valueListenable: selectedHeight,
                    builder: (context, height, child) {
                      return NumberPicker(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(color: AppColors.secondary),
                          ),
                        ),
                        haptics: true,
                        itemHeight: 120,
                        itemWidth: 130,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: AppColors.textFaded,
                                fontWeight: FontWeight.bold,
                                fontSize: 48),
                        selectedTextStyle: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 76),
                        minValue: 50,
                        maxValue: 250,
                        value: height,
                        onChanged: (value) {
                          selectedHeight.value = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: AppColors.textFaded),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        'Back',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(
                        'Continue',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
