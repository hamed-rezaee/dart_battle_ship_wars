import 'package:dart_battle_ship_wars/spaceship.dart';

class BattleField {
  Future<void> startBattle(Spaceship sp1, Spaceship sp2) async {
    while (!sp1.isDestroyed() && !sp2.isDestroyed()) {
      await Future.delayed(Duration(seconds: 1), () => sp1.hit(sp2));
      await Future.delayed(Duration(seconds: 1), () => sp2.hit(sp1));
    }
  }
}
