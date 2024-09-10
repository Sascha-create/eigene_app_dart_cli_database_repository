import 'dart:io';
import 'header_zaunfunk.dart';

void main() {
  loadingLogin();
}

void loadingLogin() {
  int times = 3;
  int length = 18;
  String load = "/";
  String space = "/";

  for (int i = 0; i < times; i++) {
    load = "/";
    for (int j = 0; j < length; j++) {
      load += space;
      header();
      print("");
      print("Du wirst angemeldet !");
      stdout.write(load);
      sleep(Duration(milliseconds: 70));
      stdout.write('\x1B[2J\x1B[0;0H');
    }
  }
}


