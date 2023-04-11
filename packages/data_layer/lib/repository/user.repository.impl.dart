import 'package:data_layer/common/mapper/user/user.mapper.dart';
import 'package:dio/dio.dart';
import 'package:domain_layer/model/user_info/user_info.model.dart';
import 'package:domain_layer/repository/user.repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/user_api/user_api.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<List<UserInfo>> getUserInfo({Map<String, String>? queries}) async {
    final userApi = UserApi(_dio);

    final result = await userApi.getUserInfos();
    final userInfos = result.map((e) => e.toModel()).toList();

    return userInfos;
  }
}
