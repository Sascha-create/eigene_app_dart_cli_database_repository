import 'dart:io';
import 'header_zaunfunk.dart';
import 'loading_login.dart';


bool isLoginCorrect(bool isLoginCorrect) {
  if (isLoginCorrect) {
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
