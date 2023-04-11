import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';
import 'package:domain_layer/common/di/injection.dart' as data;

final locator = GetIt.instance;

@InjectableInit(asExtension: false)
void configureDependencies() {
  init(locator);
  data.configureDependencies(locator);
}
