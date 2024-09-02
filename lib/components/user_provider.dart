import 'package:flutter/material.dart';
import './user_profile.dart';

class UserProvider with ChangeNotifier {
  UserProfile _user =
      UserProfile(username: 'Guest', email: 'guest@example.com', bio: '');

  UserProfile get user => _user;

  void updateUser(String username, String email, String bio) {
    _user = UserProfile(username: username, email: email, bio: bio);
    notifyListeners();
  }
}
