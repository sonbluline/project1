import 'package:explore_clone/widgets/destination_heading.dart';
import 'package:explore_clone/widgets/featured_heading.dart';
import 'package:explore_clone/widgets/featured_tiles.dart';
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import '../widgets/web_scrollbar.dart';
import '../widgets/floating_quick_access_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor:
              Theme.of(context).bottomAppBarTheme.color!.withOpacity(_opacity),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  EasyDynamicTheme.of(context).changeTheme();
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.brightness_6))
          ],
          title: Text("EXPLORE",
              style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3))),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: screenSize.height * 0.45,
                      width: screenSize.width,
                      child: Image.asset('assets/images/cover.jpg',
                          fit: BoxFit.cover)),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      FeaturedHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize)
                    ],
                  )
                ],
              ),
              DestinationHeading(screenSize: screenSize),
              // DestinationCarousel()
            ],
          ),
        ),
      ),
    );
  }
}
