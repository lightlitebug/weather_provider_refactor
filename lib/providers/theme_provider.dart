import 'package:equatable/equatable.dart';

import '../constants/constants.dart';
import 'weather_provider.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object> get props => [appTheme];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}

class ThemeProvider {
  final WeatherProvider weatherProvider;
  ThemeProvider({
    required this.weatherProvider,
  });

  ThemeState get state {
    if (weatherProvider.state.weather.theTemp > kWarmOrNot) {
      return ThemeState();
    } else {
      return ThemeState(appTheme: AppTheme.dark);
    }
  }
}
