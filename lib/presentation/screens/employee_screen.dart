import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_event.dart';
import '../bloc/bloc_state.dart';
import '../bloc/employee_bloc.dart';
import '../widgets/employee_list_item.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<EmployeeBloc>().add(FetchEmployees());
            },
          ),
        ],
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EmployeeLoaded) {
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                final employee = state.employees[index];
                return EmployeeListItem(employee: employee);
              },
            );
          } else if (state is EmployeeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown error occurred.'));
          }
        },
      ),
    );
  }
}
