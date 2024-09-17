import 'dart:io';
import 'data/database_repository.dart';
import 'data/mock_database.dart';
import 'header_zaunfunk.dart';
import 'intro.dart';
import 'loading_register.dart';
import 'login.dart';
import 'models/user.dart';
import 'models/user_article.dart';
import 'show_feed.dart';

void main() {
  DatabaseRepository mockDatabase = MockDatabase();

  bool isProgrammRunning = true;
  bool isLoginInputCorrect = false;
  String userInput = "";                // variablen entfernen
  String userArticle = "";
  String userInputName = "";
  String userInputPassword = "";
  String loggedInUser = "";
  String regiterInputName = "";
  String regiterInputPassword = "";
  String deleteInputName = "";
  String deleteInputPassword = "";

  List<UserArticle> articles = mockDatabase.getArticles();
  //List<User> users = mockDatabase.getAllUser();

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
      stdout.write("•(R)egistrieren   ");
    } else {
      print("Du hast die Auswahl zwischen :");
      stdout.write("\n");
      stdout.write("•L(o)gout   ");
    }
    if (isLoginInputCorrect) {
      stdout.write("•(F)eed anzeigen   ");
      stdout.write("•Beitrag (e)rstellen   ");
      stdout.write("•(A)ccount löschen   ");
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
        isLoginInputCorrect = isLoginCorrect(
            mockDatabase.checkLoginData(userInputName, userInputPassword));
        if (isLoginInputCorrect) {
          loggedInUser = userInputName;
          userInputName = "";
          userInputPassword = "";
        }

      case "r" || "R":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");

        print(
            "Zum registrieren, Nutzernamen und Passwort eingeben ! Mit 'Enter' bestätigen !");
        stdout.write("Nutzername : ");
        regiterInputName = stdin.readLineSync()!;
        stdout.write("Passwort : ");
        regiterInputPassword = stdin.readLineSync()!;
        mockDatabase.createUser(regiterInputName, regiterInputPassword);
        stdout.write('\x1B[2J\x1B[0;0H');
        loadingRegister();

      case "f" || "F":
        stdout.write('\x1B[2J\x1B[0;0H');
        stdout.write("\n\n");
        header();
        showFeed(mockDatabase.getFeed(articles));

      case "e" || "E":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");
        print("Beitrag verfassen und mit 'Enter' bestätigen !");
        stdout.write("Beitrag erstellen : ");
        userArticle = stdin.readLineSync()!;
        mockDatabase.createArticle(loggedInUser, userArticle);
        stdout.write('\x1B[2J\x1B[0;0H');
        stdout.write("\n\n");

      case "o" || "O":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");
        stdout.write("Besuche uns bald wieder !");
        sleep(Duration(seconds: 2));
        stdout.write('\x1B[2J\x1B[0;0H');
        isLoginInputCorrect = false;

      case "a" || "A":
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");

        print(
            "Zum löschen deines Accounts, Nutzernamen und Passwort eingeben ! Mit 'Enter' bestätigen !");
        stdout.write("Nutzername : ");
        deleteInputName = stdin.readLineSync()!;
        stdout.write("Passwort : ");
        deleteInputPassword = stdin.readLineSync()!;
        mockDatabase.deleteUser(User(userName: deleteInputName, userPassword: deleteInputPassword));
        stdout.write('\x1B[2J\x1B[0;0H');
        header();
        stdout.write("\n");
        stdout.write("Dein Account wird gelöscht !");
        sleep(Duration(seconds: 2));
        stdout.write('\x1B[2J\x1B[0;0H');
        isLoginInputCorrect = false;
    }
  }
}
