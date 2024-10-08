import '../models/user.dart';
import '../models/user_article.dart';

abstract class DatabaseRepository {
  //void showArticles(List<UserArticle> articles) {}
  List<User> getAllUser(); 

  List<UserArticle> getArticles();

  List<String> getFeed();

  //Create
  void createUser(String userName, String userPassword);
  // Check
  bool checkLoginData(String userName, String userPassword);

  //Create
  void createArticle(String userName, String userArticle);
  //Delete
  void deleteUser(User user);
}
