import '../models/user.dart';
import '../models/user_article.dart';

abstract class DatabaseRepository {
  //Create
  void createUser (String userName, String userPassword){}
  // Check
  void checkLoginData(String userName, String userPassword){}
  //Create
  void createArticle(String userName ,String userArticle){}
  //Delete
  void deleteArticle(String userName, String userArticle){}

}