import 'dart:math' as math;

abstract class Spaceship {
  Spaceship({required this.health, required this.firepower});

  int health;
  final int firepower;

  void hit(Spaceship spaceship) {
    spaceship.takeDamage(firepower);
  }

  void takeDamage(int firepower);

  bool isDestroyed() {
    final bool isDestroyed = health <= 0;

    if (isDestroyed) {
      printDead('$runtimeType\t=>\tis destroyed!!! 🔥🔥🔥🔥🔥🔥');
    }

    return isDestroyed;
  }
}

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
        math.Random().nextDouble() * (1 - maxArmorPower) + 1;
    final int effectiveDamage = (firepower * damageAbsorbing).toInt();

    health -= effectiveDamage;

    printArmoredSpaceship(
      '$runtimeType\t=>\ttook $effectiveDamage damage!\t(health: $health)',
    );
  }
}

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

class BattleField {
  Future<void> startBattle(Spaceship sp1, Spaceship sp2) async {
    while (!sp1.isDestroyed() && !sp2.isDestroyed()) {
      await Future.delayed(Duration(seconds: 1), () {
        sp1.hit(sp2);
      });

      await Future.delayed(Duration(seconds: 1), () {
        sp2.hit(sp1);
      });
    }
  }
}

Future<void> main(List<String> args) async {
  await BattleField().startBattle(
    ArmoredSpaceship(
      health: 100,
      firepower: 10,
      maxArmorPower: 0.2,
    ),
    HighSpeedSpaceship(
      health: 100,
      firepower: 10,
    ),
  );
}

void printArmoredSpaceship(String text) {
  print('\x1B[36m$text\x1B[36m');
}

void printHighSpeedSpaceship(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printDead(String text) {
  print('\x1B[31m$text\x1B[0m');
}
