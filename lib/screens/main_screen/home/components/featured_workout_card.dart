import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/helper.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/models/workout.dart';

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
