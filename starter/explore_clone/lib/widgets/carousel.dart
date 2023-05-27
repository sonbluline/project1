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

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(element, fit: BoxFit.cover),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                ? const PageScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            enlargeCenterPage: true,
            aspectRatio: 18 / 8,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
                for (int i = 0; i < imageSliders.length; i++) {
                  if (i == index) {
                    isSelected[i] = true;
                  } else {
                    isSelected[i] = false;
                  }
                }
              });
            },
          ),
          carouselController: controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width / 8),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height / 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? isHovering[i] = true
                                              : isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                              color: isHovering[i]
                                                  ? Theme.of(context)
                                                      .primaryTextTheme
                                                      .labelLarge!
                                                      .decorationColor
                                                  : Theme.of(context)
                                                      .primaryTextTheme
                                                      .labelLarge!
                                                      .color),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: isSelected[i],
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        opacity: isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          width: screenSize.width / 10,
                                          decoration: const BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
