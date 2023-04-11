// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_layer/data_source/data_source_module.dart' as _i8;
import 'package:data_layer/repository/display.repository.impl.dart' as _i5;
import 'package:data_layer/repository/user.repository.impl.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:domain_layer/repository/display.repository.dart' as _i4;
import 'package:domain_layer/repository/user.repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourceModule = _$DataSourceModule();
  gh.factory<_i3.Dio>(() => dataSourceModule.dio);
  gh.factory<_i4.DisplayRepository>(
      () => _i5.DisplayRepositoryImpl(gh<_i3.Dio>()));
  gh.factory<_i6.UserRepository>(() => _i7.UserRepositoryImpl(gh<_i3.Dio>()));
  return getIt;
}

class _$DataSourceModule extends _i8.DataSourceModule {}
