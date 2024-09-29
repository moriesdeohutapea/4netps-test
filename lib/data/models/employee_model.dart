import '../../domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.uuid,
    required super.fullName,
    required super.phoneNumber,
    required super.emailAddress,
    required super.biography,
    required super.photoUrlSmall,
    required super.photoUrlLarge,
    required super.team,
    required super.employeeType,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      uuid: json['uuid'] ?? '',
      fullName: json['full_name'] ?? 'No name',
      phoneNumber: json['phone_number'] ?? 'No phone number',
      emailAddress: json['email_address'] ?? 'No email',
      biography: json['biography'] ?? 'No biography',
      photoUrlSmall: json['photo_url_small'] ?? '',
      photoUrlLarge: json['photo_url_large'] ?? '',
      team: json['team'] ?? 'No team',
      employeeType: json['employee_type'] ?? 'No type',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'email_address': emailAddress,
      'biography': biography,
      'photo_url_small': photoUrlSmall,
      'photo_url_large': photoUrlLarge,
      'team': team,
      'employee_type': employeeType,
    };
  }
}
