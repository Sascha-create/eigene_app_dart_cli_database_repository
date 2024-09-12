import 'dart:io';
import 'header_zaunfunk.dart';


void loadingRegister() {
  int times = 3;
  int length = 20;
  String load = "/";
  String space = "/";

  for (int i = 0; i < times; i++) {
    load = "/";
    for (int j = 0; j < length; j++) {
      load += space;
      header();
      print("");
      print("Du wirst registriert !");
      stdout.write(load);
      sleep(Duration(milliseconds: 70));
      stdout.write('\x1B[2J\x1B[0;0H');
    }
  }
}