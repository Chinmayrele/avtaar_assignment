import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late User userData;

  UserProvider() {
    userData = User();
  }

  createDetailUser(Map<String, dynamic> user) {
    userData = User(
      name: user['name'],
      email: user['email'],
      contactNo: user['contactNo'],
      country: user['country'],
      city: user['city'],
      description: user['description'],
      image: user['image'],
    );
    debugPrint(userData.name);
    debugPrint(userData.email);
    notifyListeners();
    return;
  }

  getDetialUser() {
    return userData;
  }
}
