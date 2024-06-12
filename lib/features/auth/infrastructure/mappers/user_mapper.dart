import 'package:teslo_shop/features/auth/domain/entities/user.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) {
    final userData = json['result']['data'];
    return User(
      id: userData['user_id'],
      name: userData['user_name'],
      email: userData['user_email'],
      token: userData['token']
    );
  }
}
