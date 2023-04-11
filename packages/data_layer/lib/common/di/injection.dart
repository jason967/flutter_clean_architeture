import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

// final instance = GetIt.instance;

@InjectableInit(asExtension: false)
void configureDependencies(GetIt domainInstance) => init(domainInstance);
