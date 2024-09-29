import 'package:flutter/material.dart';

import '../../domain/entities/employee.dart';
import '../screens/employee_detail_screen.dart';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;

  const EmployeeListItem({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 16),
              _buildEmployeeInfo(),
              const SizedBox(width: 16),
              _buildEmployeeType(),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeDetailScreen(employee: employee),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(employee.photoUrlSmall),
      onBackgroundImageError: (_, __) => const Icon(Icons.person),
    );
  }

  Widget _buildEmployeeInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            employee.fullName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            employee.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            employee.phoneNumber,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeType() {
    return Column(
      children: [
        Text(
          employee.employeeType,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
      ],
    );
  }
}
