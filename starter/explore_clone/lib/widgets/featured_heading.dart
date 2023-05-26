import 'package:flutter/material.dart';
import './responsive.dart';

class FeaturedHeading extends StatelessWidget {
  final Size screenSize;

  const FeaturedHeading({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenSize.height * 0.06,
          left: screenSize.width / 15,
          right: screenSize.width / 15),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Unique wildlife tours & destinations',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).primaryTextTheme.titleMedium,
                ),
                const SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Unique wildlife tours & destinations',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                ),
              ],
            ),
    );
  }
}
