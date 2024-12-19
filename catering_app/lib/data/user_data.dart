import 'user_role.dart';

class UserDTO {
  String username = '';
  String token = '';
  UserRole role = UserRole.NONE;

  UserDTO({
    this.username = '',
    this.token = '',
    this.role = UserRole.NONE,
  });

  static empty() {
    return UserDTO();
  }
}
