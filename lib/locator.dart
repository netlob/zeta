import 'package:get_it/get_it.dart';
import 'package:zeta/services/zermelo_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ZermeloService());
  // locator.registerLazySingleton(() => AuthService());
  // locator.registerLazySingleton(() => DatabaseService());
  // locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => DialogService());
}
