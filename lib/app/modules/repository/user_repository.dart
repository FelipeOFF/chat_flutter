import 'package:chat/app/modules/models/user.dart';

abstract class UserRepository {
  Future<User> saveUser(User user);
  Stream<List<User>> getAllUsersStream();
}
