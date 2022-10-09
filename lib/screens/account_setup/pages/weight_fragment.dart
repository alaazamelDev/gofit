import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightFragment extends StatelessWidget {
  WeightFragment({Key? key}) : super(key: key);

  final ValueNotifier<int> selectedWeight = ValueNotifier(70);

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
                  'What is Your Weight?',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  'Weight in kg. Don\'t worry. you can always change it later.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding * 1.5,
                // horizontal: defaultPadding,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ValueListenableBuilder<int>(
                        valueListenable: selectedWeight,
                        builder: (context, age, child) {
                          return NumberPicker(
                            axis: Axis.horizontal,
                            haptics: true,
                            itemHeight: 75,
                            itemWidth: 120,
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
                            minValue: 20,
                            maxValue: 170,
                            value: age,
                            onChanged: (value) {
                              selectedWeight.value = value;
                            },
                          );
                        },
                      ),
                    ),
                    const Icon(
                      Icons.arrow_circle_up_rounded,
                      size: 40,
                      color: AppColors.secondary,
                    )
                  ],
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
