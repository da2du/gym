import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/login.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pages/Home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    _customNav(Widget destination) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false,
      );
    }

    return SalomonBottomBar(
      currentIndex: widget.index,
      onTap: (i) {
        return setState(() {
          if (i == 0) {
            _customNav(const Home());
          } else if (i == 2) {
            FirebaseAuth.instance
                .signOut()
                .whenComplete(() => _customNav(Login()));
          }
        });
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.black,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Likes"),
          selectedColor: Colors.black,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.logout),
          title: const Text("Logout"),
          selectedColor: Colors.black,
        ),
      ],
    );
  }
}
