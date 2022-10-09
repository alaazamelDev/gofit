import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';

class PhysicalLevelFragment extends StatelessWidget {
  PhysicalLevelFragment({Key? key}) : super(key: key);

  final List<String> levelsTitle = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];

  final ValueNotifier<Level> selectedLevel = ValueNotifier(Level.beginner);

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
                  'Physical Activity Level',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  'Choose your regular activity level, This will help us to personalize plans for you.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ValueListenableBuilder<Level>(
                valueListenable: selectedLevel,
                builder: (context, level, _) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Level.values.length,
                    separatorBuilder: (ctx, _) => const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    itemBuilder: (context, index) {
                      return LevelCard(
                        level: Level.values[index],
                        title: levelsTitle[index],
                        isSelected: level == Level.values[index],
                        onSelected: (lev) {
                          selectedLevel.value = lev;
                        },
                      );
                    },
                  );
                },
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
                    style:
                        ElevatedButton.styleFrom(primary: AppColors.textFaded),
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

class LevelCard extends StatelessWidget {
  const LevelCard({
    Key? key,
    required this.level,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);
  final Level level;
  final String title;
  final bool isSelected;
  final Function(Level) onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected(level);
      },
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        height: 75,
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding * 0.5,
          horizontal: defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? AppColors.secondary : Theme.of(context).cardColor,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
