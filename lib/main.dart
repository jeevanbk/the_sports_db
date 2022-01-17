import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_sports_db/sports_module/view/countries_screen.dart';
import 'package:the_sports_db/sports_module/viewModel/sports_module_view_model.dart';
import 'package:the_sports_db/utils/app_constants/constants.dart';
import 'package:the_sports_db/utils/services/navigation_handler_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Sports DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => SportsModuleViewModel(),
        child: CountriesScreen(appName: app_Name,),
      ),
      onGenerateRoute: NavigationHandlerService.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
