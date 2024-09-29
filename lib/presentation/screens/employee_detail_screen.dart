import 'package:flutter/material.dart';

import '../../domain/entities/employee.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(employee.photoUrlLarge),
                onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 60),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              employee.fullName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDetailItem(Icons.phone, employee.phoneNumber),
            _buildDetailItem(Icons.email, employee.emailAddress),
            _buildDetailItem(Icons.work, employee.team),
            _buildDetailItem(Icons.person, employee.employeeType),
            const SizedBox(height: 20),
            Text(
              'Biography',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              employee.biography,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(
            detail,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
