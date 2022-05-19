import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym/BottomNavigation/bottom_navigation.dart';
import 'package:gym/firebase_db_service.dart';
import 'package:gym/pages/detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key, this.goal}) : super(key: key);
  final goal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigation(index: 0),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(goal ?? "workouts"),
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("please wait ...");
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(
                                  url: snapshot.data.docs[index]['url'],
                                  description: snapshot.data.docs[index]
                                      ['description'],
                                  title: snapshot.data.docs[index]['title'],
                                )));
                  },
                  child: Container(
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                      ),
                      color: Colors.black.withOpacity(0.4),
                      height: 50,
                    ),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                snapshot.data.docs[index]['url'][0]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(179, 163, 162, 162)),
                    height: 200,
                  ),
                ),
              );
            }
            return const Text("");
          },
          stream: Db().uploadrec.where("category", isEqualTo: goal).snapshots(),
        )));
  }
}
