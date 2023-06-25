part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  const ThemeState({this.themeMode = ThemeMode.system});

  @override
  List<Object?> get props => [themeMode];

}

