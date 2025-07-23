import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/theme_events.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvents, bool> {
  ThemeBloc() : super(true) {
    on<InitTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      bool? isLight = shared.getBool('theme');
      emit(isLight ?? false);
    });
    on<ChangeTheme>((event, emit) async {
      var shared = await SharedPreferences.getInstance();
      await shared.setBool('theme', event.isLight);
      emit(event.isLight);
    });
  }
}
