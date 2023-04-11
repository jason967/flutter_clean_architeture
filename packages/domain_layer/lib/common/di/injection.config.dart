// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain_layer/model/common/request.model.dart' as _i5;
import 'package:domain_layer/repository/display.repository.dart' as _i4;
import 'package:domain_layer/usecase/base/api_usecase.dart' as _i6;
import 'package:domain_layer/usecase/display/get_collections.dart' as _i7;
import 'package:domain_layer/usecase/display/get_view_modules.dart' as _i8;
import 'package:domain_layer/usecase/display_usecase.dart' as _i3;
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
  gh.factory<_i3.DisplayUsecase>(
      () => _i3.DisplayUsecase(gh<_i4.DisplayRepository>()));
  gh.factory<_i5.Request>(() => _i5.Request(
        path: gh<String>(),
        params: gh<Map<String, String>>(),
      ));
  gh.factory<_i6.ApiUsecase>(() => _i7.GetCollections(gh<_i5.Request>()));
  gh.factory<_i8.GetViewModules>(() => _i8.GetViewModules(gh<_i5.Request>()));
  return getIt;
}
