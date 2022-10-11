import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';
import 'package:gofit/screens/screens.dart';

class GoalFragment extends StatelessWidget {
  GoalFragment({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: ((context) => GoalFragment()),
      );

  final ValueNotifier<List<Goal>> selectedGoals = ValueNotifier([]);
  final List<String> goals = [
    "Get Fitter",
    "Get Weight",
    "Lose Weight",
    "Building Muscles",
    "Improving Endurance",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    'What is Your Goal?',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    'You can choose more than one, Don\'t worry, you can always change it later.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: ValueListenableBuilder<List<Goal>>(
                  valueListenable: selectedGoals,
                  builder: (context, selGoals, _) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Goal.values.length,
                      separatorBuilder: (ctx, _) => const SizedBox(
                        height: defaultPadding * 0.5,
                      ),
                      itemBuilder: (context, index) {
                        return GoalCard(
                          title: goals[index],
                          goal: Goal.values[index],
                          isChecked: selGoals.contains(Goal.values[index]),
                          onChecked: (goal) {
                            if (!selectedGoals.value.contains(goal)) {
                              selectedGoals.value = [
                                ...selectedGoals.value,
                                goal
                              ];
                            } else {
                              selectedGoals.value = [...selectedGoals.value]
                                ..remove(goal);
                            }
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                      onPressed: () {
                        Navigator.push(context, PhysicalLevelFragment.route());
                      },
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
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.goal,
    required this.onChecked,
  }) : super(key: key);

  final String title;
  final bool isChecked;
  final Goal goal;
  final Function(Goal) onChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChecked(goal);
      },
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        height: 75,
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding * 0.5,
          horizontal: defaultPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: isChecked
                  ? AppColors.secondary
                  : Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Checkbox(
              value: isChecked,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              activeColor: AppColors.secondary,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
