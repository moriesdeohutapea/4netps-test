import 'package:dartz/dartz.dart';

import '../../data/models/employee_model.dart';
import '../entities/employee.dart';

abstract class EmployeeRepository {
  Future<Either<String, List<Employee>>> getEmployees();

  Future<Either<String, Employee>> addEmployee(EmployeeModel newEmployee);
}