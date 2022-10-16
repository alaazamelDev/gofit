import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/models/workout.dart';
import 'package:gofit/widgets/featured_workout_card.dart';

class MyBookmarksScreen extends StatelessWidget {
  MyBookmarksScreen({Key? key}) : super(key: key);

  // route builder
  static Route route() => MaterialPageRoute(
        builder: (context) => MyBookmarksScreen(),
      );

  final ValueNotifier<bool> isGirdView = ValueNotifier(true);
  final ValueNotifier<List<Workout>> workoutExercises = ValueNotifier(workouts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookmarks",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isGirdView,
            builder: (context, isGrid, _) {
              return IconButton(
                onPressed: () {
                  if (isGrid) {
                    isGirdView.value = false;
                  }
                },
                splashRadius: 18,
                icon: Icon(
                  Icons.reorder_rounded,
                  color: isGrid
                      ? Theme.of(context).hintColor
                      : AppColors.secondary,
                ),
              );
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isGirdView,
            builder: (context, isGrid, _) {
              return IconButton(
                onPressed: () {
                  if (!isGrid) {
                    isGirdView.value = true;
                  }
                },
                splashRadius: 18,
                icon: Icon(
                  Icons.grid_view_rounded,
                  color: !isGrid
                      ? Theme.of(context).hintColor
                      : AppColors.secondary,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 1.5),
        child: ValueListenableBuilder<bool>(
          valueListenable: isGirdView,
          builder: (context, isGrid, child) {
            if (isGrid) {
              return _buildExercisesGrid(context);
            }
            return _buildExercisesList(context);
          },
        ),
      ),
    );
  }

  Widget _buildExercisesGrid(BuildContext context) {
    return ValueListenableBuilder<List<Workout>>(
      valueListenable: workoutExercises,
      builder: (context, exercises, _) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: defaultPadding * 0.5,
            crossAxisSpacing: defaultPadding * 0.5,
          ),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return FeaturedWorkoutCard(
              workout: exercises[index],
              isSquared: true,
              onBookmarkPressed: (exercise) {},
            );
          },
        );
      },
    );
  }

  Widget _buildExercisesList(BuildContext context) {
    return ValueListenableBuilder<List<Workout>>(
      valueListenable: workoutExercises,
      builder: (context, exercises, child) {
        return ListView.separated(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: FeaturedWorkoutCard(
                workout: exercises[index],
                borderRadius: BorderRadius.circular(16),
                onBookmarkPressed: (exercise) {},
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: defaultPadding * 0.5),
        );
      },
    );
  }
}
