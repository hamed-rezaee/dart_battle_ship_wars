import 'package:dart_battle_ship_wars/armored_spaceship.dart';
import 'package:dart_battle_ship_wars/battle_field.dart';
import 'package:dart_battle_ship_wars/high_speed_spaceship.dart';

Future<void> main(List<String> args) async {
  ArmoredSpaceship armoredSpaceship = ArmoredSpaceship(
    health: 100,
    firepower: 10,
    maxArmorPower: 0.5,
  );

  HighSpeedSpaceship highSpeedSpaceship = HighSpeedSpaceship(
    health: 100,
    firepower: 10,
  );

  await BattleField().startBattle(armoredSpaceship, highSpeedSpaceship);
}
