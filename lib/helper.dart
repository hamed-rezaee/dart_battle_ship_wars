void printArmoredSpaceship(String text) {
  print('\x1B[36m$text\x1B[36m');
}

void printHighSpeedSpaceship(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printDead(String text) {
  print('\x1B[31m$text\x1B[0m');
}
