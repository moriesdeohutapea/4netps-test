import 'package:dartz/dartz.dart';

import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

class GetEmployees {
  final EmployeeRepository repository;

  GetEmployees(this.repository);

  Future<Either<String, List<Employee>>> execute() async {
    try {
      final employees = await repository.getEmployees();
      return Right(employees);
    } catch (e) {
      return const Left('Failed to fetch employees');
    }
  }
}