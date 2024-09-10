import 'database_repository.dart';
import '../models/user.dart';
import '../models/user_article.dart';

class MockDatabase implements DatabaseRepository {
  List<String> userData = [];
  Map<String, String> articleData = {};

  @override
  void createUser(String userName, String userPassword) {
    // TODO: implement createUser
  }
  @override
  void checkLoginData(String userName, String userPassword) {
    // TODO: implement checkLoginData
  }
  @override
  void createArticle(String userName, String userArticle) {
    // TODO: implement createArticle
  }
  @override
  void deleteArticle(String userName, String userArticle) {
    // TODO: implement deleteArticle
  }
  
}
