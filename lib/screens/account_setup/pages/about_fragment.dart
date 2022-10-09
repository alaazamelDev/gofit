import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';

class AboutFragment extends StatelessWidget {
  AboutFragment({Key? key}) : super(key: key);

  final ValueNotifier<Gender> selectedGender = ValueNotifier(Gender.male);

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
                  'Tell Us About Yourself',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  'To give you a better experience and results\nwe need to know your gender.',
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
                horizontal: defaultPadding,
              ),
              child: ValueListenableBuilder<Gender>(
                valueListenable: selectedGender,
                builder: (context, gender, _) {
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: GenderSelector(
                          gender: Gender.male,
                          isSelected: gender == Gender.male,
                          onClicked: (gen) {
                            selectedGender.value = gen;
                          },
                        ),
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: GenderSelector(
                          gender: Gender.female,
                          isSelected: gender == Gender.female,
                          onClicked: (gen) {
                            selectedGender.value = gen;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Text(
                  'Continue',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    Key? key,
    required this.gender,
    required this.onClicked,
    required this.isSelected,
  }) : super(key: key);

  final Gender gender;
  final Function(Gender) onClicked;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: () {
          onClicked(gender);
        },
        borderRadius: BorderRadius.circular(180),
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.secondary : AppColors.textFaded,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == Gender.male
                    ? Icons.male_rounded
                    : Icons.female_rounded,
                color: AppColors.textLight,
                size: (MediaQuery.of(context).size.width * 0.5) * 0.4,
              ),
              const SizedBox(height: defaultPadding * 0.5),
              Text(gender == Gender.male ? "Male" : "Female",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5))
            ],
          ),
        ),
      ),
    );
  }
}
