import 'package:flutter/material.dart';
import './responsive.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({super.key});

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images';
  final CarouselController controller = CarouselController();

  List isHovering = [false, false, false, false, false, false, false];
  List isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  int current = 0;

  final List<String> iamges = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
