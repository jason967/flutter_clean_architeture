import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_architecture/common/cubit/bottom_navigation_cubit.dart';
import 'bloc_architecture/home/core/view_modules.dart';
import 'bloc_architecture/router.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //DI
  configureDependencies();
  initReflect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavigaionCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: blocRouter,
      ),
    );
  }
}
