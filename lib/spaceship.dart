import 'package:dart_battle_ship_wars/helper.dart';

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
