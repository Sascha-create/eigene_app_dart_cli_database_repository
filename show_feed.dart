import 'dart:io';


void showFeed(List<String> articles) {
  for (int i = 0; i < articles.length; i++) {
    stdout.write("\n\n");
    stdout.write("   ${getLine(articles[i])}\n\n");
    print("   ${articles[i]}\n");
    stdout.write("   ${getLine(articles[i])}\n\n");
  }
}

String getLine(String article) {
  String line = "";
  for (int i = 0; i < article.length; i++) {
    line += "-";
  }
  return line;
}
