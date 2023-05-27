import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import '../screens/home_page.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;
  const TopBarContents({super.key, required this.opacity});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  final List<String> menu = ['Discover', '', 'Contact Us'];

  bool isProccessing = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Theme.of(context)
              .bottomAppBarTheme
              .color!
              .withOpacity(widget.opacity),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('EXPLORE',
                    style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenSize.width / 8,
                      ),
                      ...Iterable<int>.generate(menu.length)
                          .map((int index) => menu[index].isEmpty
                              ? SizedBox(width: screenSize.width / 20)
                              : InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      value
                                          ? isHovering[index] = true
                                          : isHovering[index] = false;
                                    });
                                  },
                                  onTap: () {},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(menu[index],
                                          style: TextStyle(
                                              color: isHovering[index]
                                                  ? Colors.blue[200]
                                                  : Colors.white)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Visibility(
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          visible: isHovering[index],
                                          child: Container(
                                            height: 2,
                                            width: 20,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ))
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      EasyDynamicTheme.of(context).changeTheme();
                    },
                    icon: const Icon(Icons.brightness_6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.white),
                SizedBox(
                  width: screenSize.width / 50,
                ),
                InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? isHovering[menu.length] = true
                            : isHovering[menu.length] = false;
                      });
                    },
                    onTap: user)
              ],
            ),
          ),
        ));
  }
}
