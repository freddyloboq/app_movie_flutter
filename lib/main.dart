import 'package:flutter/material.dart';
import 'package:app_movies_flutter/screens/screens.dart';
import 'package:app_movies_flutter/Themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Peículas',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsScreen(),
        },
        theme: AppTheme.lightTheme
        // theme: AppTheme.darkTheme
        // theme: ThemeData.light()
        //     .copyWith(appBarTheme: AppBarTheme(color: Colors.deepPurple[900])),
        // theme: ThemeData.dark(),
        );
  }
}
