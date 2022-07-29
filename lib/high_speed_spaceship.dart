import 'dart:math' as math;

import 'package:dart_battle_ship_wars/helper.dart';
import 'package:dart_battle_ship_wars/spaceship.dart';

class HighSpeedSpaceship extends Spaceship {
  HighSpeedSpaceship({
    required int health,
    required int firepower,
  }) : super(health: health, firepower: firepower);

  bool dodging = false;

  @override
  void takeDamage(int firepower) {
    bool getsDamage = math.Random().nextBool();

    if (getsDamage) {
      health -= firepower;

      printHighSpeedSpaceship(
        '$runtimeType\t=>\ttook $firepower damage!\t(health: $health)',
      );
    } else {
      printHighSpeedSpaceship(
        '$runtimeType\t=>\tdodged damage!\t(health: $health)',
      );
    }
  }
}
