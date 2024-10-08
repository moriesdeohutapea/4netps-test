import 'package:fornetps_test_tech/utils/env_config.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/employee_repositories_impl.dart';
import 'data/services/api_service.dart';
import 'domain/repositories/employee_repository.dart';
import 'domain/usecases/get_employees.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(baseUrl: EnvConfig.baseUrl),
  );

  getIt.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(),
  );

  getIt.registerLazySingleton<GetEmployees>(
    () => GetEmployees(getIt<EmployeeRepository>()),
  );
}
