import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/helper.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';
import 'package:gofit/domain/models/workout.dart';
import 'package:gofit/screens/main_screen/home/components/section_title.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ValueNotifier<Level> selectedLevel = ValueNotifier(Level.intermediate);
  final ValueNotifier<List<Workout>> workoutExercises = ValueNotifier(workouts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Morning, Christina 👋🏻",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleMedium!.color),
          ),
          const SizedBox(height: defaultPadding),
          SectionTitle(
            onPressed: () {},
            actionTitle: "See All",
            title: "Featured Workout",
          ),
          const SizedBox(height: defaultPadding * 0.5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ValueListenableBuilder<List<Workout>>(
              valueListenable: workoutExercises,
              builder: (context, exercises, _) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: FeaturedWorkoutCard(
                        onBookmarkPressed: (id) {
                          final updatedList = exercises
                            ..forEach((element) {
                              if (element.id == id) {
                                element.isBookmarked = !element.isBookmarked;
                              }
                            });

                          workoutExercises.value = [...updatedList];
                        },
                        workout: exercises[index],
                      ),
                    );
                  },
                  separatorBuilder: (ctx, idx) =>
                      const SizedBox(width: defaultPadding * 0.5),
                );
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          SectionTitle(
            onPressed: () {},
            actionTitle: "See All",
            title: "Workout Levels",
          ),
          SizedBox(
            height: 35,
            child: ValueListenableBuilder(
              valueListenable: selectedLevel,
              builder: (context, level, _) {
                return Row(
                  children: [
                    Expanded(
                      child: WorkoutLevelItem(
                        label: "Beginner",
                        isSelected: level == Level.beginner,
                        level: Level.beginner,
                        onItemSelected: (lev) {
                          selectedLevel.value = lev;
                        },
                      ),
                    ),
                    const SizedBox(width: defaultPadding * 0.5),
                    Expanded(
                      child: WorkoutLevelItem(
                        label: "Intermediate",
                        isSelected: level == Level.intermediate,
                        level: Level.intermediate,
                        onItemSelected: (lev) {
                          selectedLevel.value = lev;
                        },
                      ),
                    ),
                    const SizedBox(width: defaultPadding * 0.5),
                    Expanded(
                      child: WorkoutLevelItem(
                        label: "Advanced",
                        isSelected: level == Level.advanced,
                        level: Level.advanced,
                        onItemSelected: (lev) {
                          selectedLevel.value = lev;
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: defaultPadding * 0.5),
          ValueListenableBuilder<Level>(
            valueListenable: selectedLevel,
            builder: (context, level, _) {
              return ValueListenableBuilder<List<Workout>>(
                valueListenable: workoutExercises,
                builder: (context, exercises, _) {
                  return Flexible(
                    child: FeaturedWorkoutCard(
                      workout: exercises
                          .firstWhere((element) => element.level == level),
                      onBookmarkPressed: (id) {
                        final updatedList = exercises
                          ..forEach((element) {
                            if (element.id == id) {
                              element.isBookmarked = !element.isBookmarked;
                            }
                          });

                        workoutExercises.value = [...updatedList];
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class WorkoutLevelItem extends StatelessWidget {
  const WorkoutLevelItem({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.level,
    required this.onItemSelected,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final Level level;
  final Function(Level) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemSelected(level);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary, width: 2),
          borderRadius: BorderRadius.circular(45),
          color: isSelected ? AppColors.secondary : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isSelected ? AppColors.textLight : AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class FeaturedWorkoutCard extends StatelessWidget {
  const FeaturedWorkoutCard({
    Key? key,
    required this.workout,
    required this.onBookmarkPressed,
  }) : super(key: key);

  final Function(int) onBookmarkPressed;
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            child: Image.asset(
              workout.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height * 0.3) * 0.1,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.textLight,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: defaultPadding * 0.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${workout.duration} minutes  |  ${Helper.getLevelLabel(workout.level!)}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.textFaded),
                      ),
                      const SizedBox(width: defaultPadding * 0.5),
                      GestureDetector(
                        onTap: () {
                          onBookmarkPressed(workout.id!);
                        },
                        child: SvgPicture.asset(
                          workout.isBookmarked
                              ? kBookmarkFilledSvg
                              : kBookmarkOutlinedSvg,
                          color: AppColors.textFaded,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
