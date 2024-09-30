import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fornetps_test_tech/presentation/bloc/bloc_event.dart';
import 'package:fornetps_test_tech/presentation/bloc/employee_bloc.dart';
import 'package:fornetps_test_tech/presentation/screens/employee_screen.dart';
import 'package:fornetps_test_tech/utils/env_config.dart';
import 'package:get_it/get_it.dart';

import 'injection.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.loadEnv('');
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => EmployeeBloc()..add(FetchEmployees()),
            child: const EmployeeScreen(),
          ),
        ),
      ),
    );
  }
}
