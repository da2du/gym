import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/Home.dart';
import 'package:gym/pages/admin/upload.dart';
import 'package:gym/pages/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['role'] == 'customer') {
                  return Home(
                    goal: snapshot.data['goal'],
                  );
                } else {
                  return Upload();
                }
              }
              return const Text("");
            })
        : Login();
  }
}
