import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/user/widgets/globalVarialbles.dart';
import 'package:flutter/material.dart';

class CrouselImages extends StatelessWidget {
  const CrouselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((i) {
          return Builder(builder: (BuildContext context) {
            return Image.network(
              i,
              fit: BoxFit.cover,
              height: 200,
            
            );
          });
        }).toList(),
        options: CarouselOptions(viewportFraction: 1,height: 200));
  }
}
