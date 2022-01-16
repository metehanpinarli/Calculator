import 'package:calculator_task/bloc/button/button_bloc.dart';
import 'package:calculator_task/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/calculator/calculator_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculatorBloc>(
          create: (context) => locator<CalculatorBloc>(),
        ),
        BlocProvider<ButtonBloc>(
          create: (context) => ButtonBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(brightness:Brightness.dark,primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.grey[800]),
        ),
        home: const SafeArea(child: HomeView()),
      ),
    );
  }
}
