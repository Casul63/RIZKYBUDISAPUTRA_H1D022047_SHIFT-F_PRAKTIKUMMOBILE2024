import 'dart:math';
import 'dart:io';

class RussianRoulette {
  int ammo;
  late int bullet = Random().nextInt(ammo);

  RussianRoulette(this.ammo) {
    bullet = Random().nextInt(ammo);
  }

  List<int> bulletListInitializer() {
    var bulletList = <int>[];

    for (int i = 0; i < ammo; i++) {
      bulletList.add(i);
    }

    return bulletList;
  }

  void game() {
    int live = 1;
    int score = 0;

    print("Let's start");

    while (live == 1 && score <= ammo) {
      print("Fire? Y/N");
      String? answer = stdin.readLineSync();
      if (answer == "Y") {
        int gacha = Random().nextInt(ammo);
        if (gacha == bullet) {
          print("YOU DIED. YOU LOSE");
          live = 0;
        } else {
          score++;
          print("YOU LIVE. Score = $score");
        }
      } else if (answer == "N") {
        print("Score = $score");
        live = 0;
      } else {
        print("PLEASE INPUT Y / N CORRECTLY (CASE SENSITIVE)");
      }
    }
  }
}

void main() {
  // print("Ammo amount = ");
  // String? answer = stdin.readLineSync();
  int? inputNumber;
  bool validInput = false;

  while (!validInput) {
    print("Enter the number of bullets: ");
    String? input = stdin.readLineSync();
    try {
      inputNumber = int.parse(input!);
      validInput = true; // Input valid, keluar dari loop
      RussianRoulette r = RussianRoulette(inputNumber);
      r.bulletListInitializer();
      r.game();
    } catch (e) {
      print("Please enter a valid number!");
    }
  }
}
