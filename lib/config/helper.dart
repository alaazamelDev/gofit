import 'dart:math';

import 'package:gofit/domain/enums.dart';

class Helper {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/300/300?random=$randomInt';
  }

  static String getLevelLabel(Level level) {
    switch (level) {
      case Level.beginner:
        return "Beginner";
      case Level.intermediate:
        return "Intermediate";
      case Level.advanced:
        return "Advanced";
      default:
        return "";
    }
  }
}
