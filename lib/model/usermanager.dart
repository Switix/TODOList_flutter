import 'package:todolist/model/user.dart';

class UserManager {
  static List<User> users = [];
  static User? loggedUser;

  static User findUser(String login, String password) {
    for (User user in users) {
      if (user.login == login && user.password == password) {
        loggedUser = user;
        return user;
      }
    }
    return User(id: "", login: "", name: "", password: "");
  }
}
