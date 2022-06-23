import 'package:flutter/material.dart';
import 'package:app_movies_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        //El SingleChildScrollView es para poder hacer scroll en la app. Sino se corta y muestra un error.
        body: SingleChildScrollView(
          child: Column(
            children: [CardSwiperScreen(), MovieSlider()],
          ),
        ));
  }
}
