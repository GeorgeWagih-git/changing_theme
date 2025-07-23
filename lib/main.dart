import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/home_page.dart';
import 'package:project/theme_bloc.dart';
import 'package:project/theme_events.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getDataFromShared() async {
  await SharedPreferences.getInstance();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDataFromShared();
  print('Hello');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()..add(InitTheme())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
