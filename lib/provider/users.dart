import 'dart:math';

import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

import '../data/dummy_users.dart';

class Users with ChangeNotifier {
  final Map<String, User> _itens = {...DUMMY_USERS};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null && user.id!.trim().isNotEmpty && _itens.containsKey(user.id)) {
      _itens.update(
          user.id!,
          (_) => User(
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          (() => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              )));
    }

    //adicionar
    //ou alterar

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }
}
