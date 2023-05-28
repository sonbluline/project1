import 'package:explore_clone/screens/home_page.dart';

import '../utils/authentication.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.blueGrey, width: 3),
          ),
          color: Colors.white),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blueGrey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.blueGrey, width: 3),
            ),
            elevation: 0),
        onPressed: () async {
          setState(() {
            isProcessing = true;
          });

          await signInWithGoogle().then((result) {
            print(result);
            if (result != null) {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const HomePage()));
            }
          }).catchError((error) {
            print('Registration Error: $error');
          });

          setState(() {
            isProcessing = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: isProcessing
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
