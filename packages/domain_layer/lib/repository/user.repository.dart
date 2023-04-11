import '../model/user_info/user_info.model.dart';

abstract class UserRepository {
  Future<List<UserInfo>> getUserInfo({Map<String, String>? queries});
}
