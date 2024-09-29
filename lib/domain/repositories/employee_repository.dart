import '../../data/models/employee_model.dart';
import '../entities/employee.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getEmployees();

  Future<Employee> addEmployee(EmployeeModel newEmployee);
}
