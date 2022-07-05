import 'package:app_movies_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperScreen extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiperScreen({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.6,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.5,
        // itemBuilder: (BuildContext context, int index){
        itemBuilder: (_, int index) {
          final movie = movies[index];
          // print(movie.fullPosterImg);
          movie.heroId = 'swiper-${movie.id}';

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  // placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  // image: NetworkImage('https://via.placeholder.com/300x400'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
