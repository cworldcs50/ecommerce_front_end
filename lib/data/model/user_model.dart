import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/services.dart';

class UserModel extends Equatable {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  }) {
    toSharedPrefs();
  }

  final int id;
  final String username;
  final String email;
  final String password;
  final String phone;

  factory UserModel.fromJson(Map<String, dynamic> jsonData) => UserModel(
    id: jsonData["users_id"],
    username: jsonData["users_name"],
    email: jsonData["users_email"],
    password: jsonData["users_password"],
    phone: jsonData["users_phone"],
  );

  Future<void> toSharedPrefs() async {
    SharedPreferences sharedPrefs = Get.find<Services>().prefs;

    await sharedPrefs.setInt("user_id", id);
    await sharedPrefs.setString("user_name", username);
    await sharedPrefs.setString("user_email", email);
    await sharedPrefs.setString("user_password", password);
    await sharedPrefs.setString("user_phone", phone);
  }

  @override
  String toString() => "$username\t$email\n$password\t$phone\n$id";

  @override
  List<Object?> get props => [id, username, email, password, phone];
}
