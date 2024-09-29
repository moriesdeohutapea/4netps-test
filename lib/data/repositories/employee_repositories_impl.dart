import 'package:get_it/get_it.dart';

import '../../domain/entities/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../models/employee_model.dart';
import '../services/api_service.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final ApiService _apiService = GetIt.I<ApiService>();

  @override
  Future<List<Employee>> getEmployees() async {
    final employeeModels = await _apiService.get<EmployeeModel>(
      path: 'employees.json',
      listKey: 'employees',
      fromJson: (json) => EmployeeModel.fromJson(json),
    );
    return employeeModels.map(_mapToEmployee).toList();
  }

  @override
  Future<Employee> addEmployee(EmployeeModel newEmployee) async {
    final addedEmployee = await _apiService.post<EmployeeModel>(
      path: 'employees.json',
      data: newEmployee.toJson(),
      fromJson: (json) => EmployeeModel.fromJson(json),
    );
    return _mapToEmployee(addedEmployee);
  }

  Employee _mapToEmployee(EmployeeModel model) {
    return Employee(
      uuid: model.uuid,
      fullName: model.fullName,
      phoneNumber: model.phoneNumber,
      emailAddress: model.emailAddress,
      biography: model.biography,
      photoUrlSmall: model.photoUrlSmall,
      photoUrlLarge: model.photoUrlLarge,
      team: model.team,
      employeeType: model.employeeType,
    );
  }
}
