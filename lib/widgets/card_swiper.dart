import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'details',
            arguments: 'movie-instance'),
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.7,
          itemHeight: size.height * 0.4,
          // itemBuilder: (BuildContext context, int index){
          itemBuilder: (_, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                // placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
