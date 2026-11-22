import 'dart:math' as math;

class RandomNumbers {
  static int comments = math.Random().nextInt(2001) + 1;
  static int distance = math.Random().nextInt(20) + 1;
  static int time = math.Random().nextInt(60) + 1;
}
