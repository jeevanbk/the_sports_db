import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_sports_db/sports_module/view/countries_screen.dart';
import 'package:the_sports_db/sports_module/view/country_leagues_screen.dart';
import 'package:the_sports_db/sports_module/viewModel/sports_module_view_model.dart';

class NavigationHandlerService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.countriesScreen:
        final String countryName = settings.arguments as String;

        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (context) => SportsModuleViewModel(),
                child: CountryLeaguesScreen(
                  countryName: countryName,
                )));
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}

class AppRoutes {
  static const String countriesScreen = 'countriesScreen';
}
