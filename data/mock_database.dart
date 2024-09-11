import 'database_repository.dart';
import '../models/user.dart';
import '../models/user_article.dart';

class MockDatabase implements DatabaseRepository {
  List<User> users = [User(userName: "Sascha", userPassword: "baum123")];
  List<UserArticle> articles = [
    UserArticle(
        userName: "Otto", userArticle: "Ich habe Gehwegplatten abzugeben !"),
    UserArticle(
        userName: "Jane",
        userArticle: "Will jemand Ableger von meinen Rosen haben ?")
  ];

  @override
  List<UserArticle> getArticles() {
    return articles;
  }

  @override
  List<String> getFeed(List<UserArticle> articles) {
    List<String> feed = [];
    for (UserArticle currentArticle in articles) {
      feed.add("${currentArticle.userName} : ${currentArticle.userArticle}");
    }
    return feed;
  }

  @override
  void createUser(String userName, String userPassword) {
    User newUser = User(userName: userName, userPassword: userPassword);
    users.add(newUser);
  }

  @override
  bool checkLoginData(String userName, String userPassword) {
    for (User currentUser in users) {
      if (currentUser.userName == userName) {
        if (currentUser.userPassword == userPassword) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  @override
  void createArticle(String userName, String userArticle) {
    UserArticle newUserArticle =
        UserArticle(userName: userName, userArticle: userArticle);
    articles.add(newUserArticle);
  }

  @override
  void deleteUser(String userName, String userPassword) {
    if (users.contains(User(userName: userName, userPassword: userPassword))) {
      users.remove(User(userName: userName, userPassword: userPassword));
    }
  }
}
