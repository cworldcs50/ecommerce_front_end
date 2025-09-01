import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String id;
  final String username;
  final String email;
  final String password;
  final String phone;

  @override
  List<Object?> get props => [id, username, email, password, phone];
}
