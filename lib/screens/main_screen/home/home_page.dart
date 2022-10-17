import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/domain/enums.dart';
import 'package:gofit/domain/models/workout.dart';
import 'package:gofit/widgets/featured_workout_card.dart';
import 'package:gofit/screens/main_screen/home/components/section_title.dart';
import 'package:gofit/screens/main_screen/home/components/workout_level_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ValueNotifier<Level> selectedLevel = ValueNotifier(Level.intermediate);
  final ValueNotifier<List<Workout>> workoutExercises = ValueNotifier(workouts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding * 1.5,
        defaultPadding * 1.5,
        defaultPadding * 1.5,
        defaultPadding * 0.5,
      ),
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
          const SizedBox(height: defaultPadding),
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
