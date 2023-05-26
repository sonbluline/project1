import './responsive.dart';
import 'package:flutter/material.dart';

class DestinationHeading extends StatelessWidget {
  final Size screenSize;
  const DestinationHeading({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.symmetric(vertical: screenSize.height / 20)
          : EdgeInsets.only(
              top: screenSize.height / 10, bottom: screenSize.height / 15),
      width: screenSize.width,
      child: Text(
        'Destinations diversity',
        style: TextStyle(
            fontSize: ResponsiveWidget.isSmallScreen(context) ? 24 : 40,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
