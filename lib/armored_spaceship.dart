import 'dart:math' as math;

import 'package:dart_battle_ship_wars/helper.dart';
import 'package:dart_battle_ship_wars/spaceship.dart';

class ArmoredSpaceship extends Spaceship {
  ArmoredSpaceship({
    required int health,
    required int firepower,
    required this.maxArmorPower,
  }) : super(health: health, firepower: firepower);

  final double maxArmorPower;

  @override
  void takeDamage(int firepower) {
    final double damageAbsorbing =
        1 - math.Random().nextDouble() * maxArmorPower;
    final int effectiveDamage = (firepower * damageAbsorbing).toInt();

    health -= effectiveDamage;

    printArmoredSpaceship(
      '$runtimeType\t=>\ttook $effectiveDamage damage!\t(health: $health)',
    );
  }
}
