import 'dart:io';
import 'header_zaunfunk.dart';
import 'login.dart';
import 'show_feed.dart';
import 'intro.dart';

void main() {
  bool isProgrammRunning = true;
  bool isLoginInputCorrect = false;
  String userInput = "";
  String userArticle = "";
  String userInputName = "";
  String userInputPassword = "";

  List<String> feed = [
    "Otto : Ich habe Gehwegplatten abzugeben !",
    "Jane : Möchte jemand Ableger von meinen Rosen haben ?"
  ];

  stdout.write('\x1B[2J\x1B[0;0H');
  intro();
  sleep(Duration(seconds: 2));
  stdout.write('\x1B[2J\x1B[0;0H');

  while (isProgrammRunning) {
    header();

    if (!isLoginInputCorrect) {
      print("Du hast die Auswahl zwischen :");
      print("(einloggen für mehr Auswahl)");
      stdout.write("\n");
      stdout.write("•(L)ogin   ");
    } else {
      print("Du hast die Auswahl zwischen :");
      stdout.write("\n");
      stdout.write("•L(o)gout   ");
    }
    if (isLoginInputCorrect) {
      stdout.write("•(F)eed anzeigen   ");
      stdout.write("•Beitrag (e)rstellen   ");
    }
    stdout.write("•Programm (b)eenden");
    stdout.write("\n\n");
    stdout.write("mit 'Enter' bestätigen !");
    stdout.write("\n\n");

    stdout.write("Eingabe : ");
    userInput = stdin.readLineSync()!;

    switch (userInput) {
      case "b" || "B":
        stdout.write('\x1B[2J\x1B[0;0H');
        isProgrammRunning = false;
      case "l" || "L":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");

        print(
            "Für Login den Nutzernamen und Passwort eingeben ! Mit 'Enter' bestätigen !");
        stdout.write("Nutzername : ");
        userInputName = stdin.readLineSync()!;
        stdout.write("Passwort : ");
        userInputPassword = stdin.readLineSync()!;
        isLoginInputCorrect = isLoginCorrect(userInputName, userInputPassword);

      case "f" || "F":
        stdout.write('\x1B[2J\x1B[0;0H');
        stdout.write("\n\n");
        header();
        showFeed(feed);

      case "e" || "E":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");
        print("Beitrag verfassen und mit 'Enter' bestätigen !");
        stdout.write("Beitrag erstellen : ");
        userArticle = stdin.readLineSync()!;
        feed.add("$userName : " + "$userArticle");
        stdout.write('\x1B[2J\x1B[0;0H');
        stdout.write("\n\n");
        header();
        showFeed(feed);
      case "o" || "O":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");
        stdout.write("Besuche uns bald wieder !");
        sleep(Duration(seconds: 2));
        stdout.write('\x1B[2J\x1B[0;0H');
        isLoginInputCorrect = false;
    }
  }
}
