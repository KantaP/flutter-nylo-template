import 'package:flutter_app/app/di/components/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

@injectableInit
GetIt configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);


abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const uat = 'uat';
}

final logger = Logger();
