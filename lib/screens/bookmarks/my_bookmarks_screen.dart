import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class MyBookmarksScreen extends StatelessWidget {
  MyBookmarksScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> isGirdView = ValueNotifier(true);

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
    return Container();
  }

  Widget _buildExercisesList(BuildContext context) {
    return Container();
  }
}
