import 'package:gofit/domain/enums.dart';

class Workout {
  final int? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Level? level;
  bool isBookmarked;

  Workout({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.level,
    this.isBookmarked = false,
  });
}

final List<Workout> workouts = [
  Workout(
    id: 0,
    title: "Full Body Stretching",
    imageUrl: "assets/images/workout-3.jpg",
    duration: 10,
    level: Level.intermediate,
    isBookmarked: false,
  ),
  Workout(
    id: 1,
    title: "Squat Movmenent Exercise",
    imageUrl: "assets/images/workout-2.jpg",
    duration: 12,
    level: Level.beginner,
    isBookmarked: false,
  ),
  Workout(
    id: 2,
    title: "Yoga Women Exercise",
    imageUrl: "assets/images/workout-5.jpg",
    duration: 8,
    level: Level.advanced,
    isBookmarked: false,
  ),
  Workout(
    id: 3,
    title: "Abdominal Exercise",
    imageUrl: "assets/images/workout-6.jpg",
    duration: 6,
    level: Level.beginner,
    isBookmarked: false,
  ),
];
