import 'dart:io';
import 'header_zaunfunk.dart';
import 'loading.dart';

String userName = "Sascha";
String userPassword = "baum123";

bool isLoginCorrect(String userInputName, String userInputPassword) {
  if (userInputName == userName && userInputPassword == userPassword) {
    stdout.write('\x1B[2J\x1B[0;0H');
    loadingLogin();
    return true;
  } else {
    stdout.write('\x1B[2J\x1B[0;0H');
    header();
    print("");
    print("Nutzername oder Passwort falsch !");
    sleep(Duration(seconds: 2));
    stdout.write('\x1B[2J\x1B[0;0H');
    return false;
  }
}
