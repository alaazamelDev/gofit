import 'package:flutter/material.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/enums.dart';

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
