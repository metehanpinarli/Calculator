import 'package:calculator_task/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/operations_bloc.dart';
import 'injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<OperationsBloc>(),
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.deepPurple, scaffoldBackgroundColor: Colors.black),
        home: const SafeArea(child: HomeView()),
      ),
    );
  }
}
