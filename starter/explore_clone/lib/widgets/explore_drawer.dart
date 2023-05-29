import '../screens/home_page.dart';
import '../utils/authentication.dart';
import 'package:flutter/material.dart';
import 'auth_dialog.dart';

class ExploreDrawer extends StatefulWidget {
  const ExploreDrawer({super.key});

  @override
  State<ExploreDrawer> createState() => _ExploreDrawerState();
}

class _ExploreDrawerState extends State<ExploreDrawer> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarTheme.color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userEmail == null
                  ? SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AuthDialog(),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              imageUrl != null ? NetworkImage(imageUrl!) : null,
                          child: imageUrl != null
                              ? const Icon(
                                  Icons.account_circle,
                                  size: 40,
                                )
                              : Container(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          name ?? userEmail ?? '',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              userEmail != null
                  ? SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: _isProcessing
                            ? null
                            : () async {
                                setState(() {
                                  _isProcessing = true;
                                });
                                await signOut().then((result) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) =>
                                              const HomePage()));
                                }).catchError((error) {
                                  print('Sign Out Error: $error');
                                });
                                setState(() {
                                  _isProcessing = false;
                                });
                              },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: _isProcessing
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Sign out',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  : Container(),
              userEmail != null ? const SizedBox(height: 20) : Container(),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Discover',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2020 | EXPLORE',
                    style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
