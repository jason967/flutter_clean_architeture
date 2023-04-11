import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data_layer/common/di/injection.dart' as data;
import 'injection.config.dart';

@InjectableInit(asExtension: false)
void configureDependencies(GetIt locator) {
  init(locator);
  data.configureDependencies(locator);
}
