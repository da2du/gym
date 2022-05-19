import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/login.dart';

class UploadAppBar extends StatefulWidget {
  const UploadAppBar({Key? key, this.onDonePressed}) : super(key: key);
  final VoidCallback? onDonePressed;
  @override
  State<UploadAppBar> createState() => _UploadAppBarState();
}

class _UploadAppBarState extends State<UploadAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .whenComplete(() => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false,
                      ));
            },
            icon: const Icon(Icons.logout)),
        const Text(
          "welcome back admin",
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
            color: Colors.orange,
            onPressed: () => widget.onDonePressed,
            icon: const Icon(Icons.done))
      ],
    );
  }
}
