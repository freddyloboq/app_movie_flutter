import 'package:flutter/material.dart';
import 'package:app_movies_flutter/screens/screens.dart';
import 'package:app_movies_flutter/Themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:app_movies_flutter/providers/movies_provider.dart';

// void main() => runApp(MyApp());
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

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
