import 'package:dartz/dartz.dart';

import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetEmployees {
  final EmployeeRepository repository;

  GetEmployees(this.repository);

  Future<Either<String, List<Employee>>> execute() async {
    return await repository.getEmployees();
  }
}