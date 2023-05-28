import 'package:explore_clone/screens/home_page.dart';
import 'package:explore_clone/utils/authentication.dart';
import 'package:explore_clone/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
// import '../screens/home_page.dart';

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

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return PreferredSize(
        preferredSize: Size(screenSize.width, 200),
        child: Container(
          color: Theme.of(context)
              .bottomAppBarTheme
              .color!
              .withOpacity(widget.opacity),
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                    onTap: userEmail == null
                        ? () {
                            showDialog(
                                context: context,
                                builder: (context) => const AuthDialog());
                          }
                        : null,
                    child: userEmail != null
                        ? Text(
                            'Sign In',
                            style: TextStyle(
                                color: isHovering[menu.length]
                                    ? Colors.white
                                    : Colors.white70),
                          )
                        : Row(
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundImage: imageUrl != null
                                      ? NetworkImage(imageUrl!)
                                      : null,
                                  child: imageUrl == null
                                      ? const Icon(
                                          Icons.account_circle,
                                          size: 30,
                                        )
                                      : Container()),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                name ?? userEmail ?? '',
                                style: TextStyle(
                                    color: isHovering[menu.length]
                                        ? Colors.white
                                        : Colors.white70),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.blueGrey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: isProcessing
                                      ? null
                                      : () async {
                                          setState(() {
                                            isProcessing = true;
                                          });
                                          await signOut().then((result) {
                                            print(result);
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        fullscreenDialog: true,
                                                        builder: (context) =>
                                                            HomePage()));
                                          }).catchError((error) {
                                            print('Sign Out Error: $error');
                                          });
                                          setState(() {
                                            isProcessing = false;
                                          });
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: isProcessing
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            'Sign out',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                  ))
                            ],
                          ))
              ],
            ),
          ),
        ));
  }
}
