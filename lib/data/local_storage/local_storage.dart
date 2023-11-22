import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/models/user.dart';

class LocalStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const _keyUser = 'user';
  static const _keyToken = 'token';

  static Future setUser(UserData user) async {
    final userData = jsonEncode(user.toJson());
    await storage.write(key: _keyUser, value: userData);
  }

  static Future<String> getUser() async =>
      await storage.read(key: _keyUser) ?? 'No user found';

  static Future deleteUser() async =>
      await storage.delete(key: _keyUser);

  static Future setToken(String token) async =>
      await storage.write(key: _keyToken, value: token);

}