import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_employees.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployees getEmployees = GetIt.I<GetEmployees>();

  EmployeeBloc() : super(EmployeeLoading()) {
    on<FetchEmployees>((event, emit) async {
      emit(EmployeeLoading());
      try {
        final employees = await getEmployees.execute();
        emit(EmployeeLoaded(employees));
      } catch (e) {
        emit(EmployeeError('Failed to fetch employees'));
      }
    });
  }
}
