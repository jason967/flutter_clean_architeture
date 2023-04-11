// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain_layer/usecase/display_usecase.dart' as _i4;
import 'package:e_commerce_architecture_ver_1_0/bloc_architecture/home/bloc/collections/collections_bloc.dart'
    as _i3;
import 'package:e_commerce_architecture_ver_1_0/bloc_architecture/home/bloc/view_modules/view_modules_bloc.dart'
    as _i5;
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
  gh.factory<_i3.CollectionsBloc>(
      () => _i3.CollectionsBloc(gh<_i4.DisplayUsecase>()));
  gh.factory<_i5.ViewModulesBloc>(
      () => _i5.ViewModulesBloc(gh<_i4.DisplayUsecase>()));
  return getIt;
}
