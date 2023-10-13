import 'package:flutter/foundation.dart';
import '../models/User.dart';


class UtilisateurProvider with ChangeNotifier{
  User? _users;

  User? get user => _users;

  void setUser(User user){
    _users = user;
    notifyListeners();
  }
}