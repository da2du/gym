import 'package:flutter/material.dart';
import 'package:gym/pages/detail.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Workouts"),
      ),
      body: SafeArea(child: 
      ListView.builder(itemCount: 6,
      itemBuilder:(context, index) => 
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail()));
        },
        child: Container(
          child: const Center(child: Text("Please wait..."),),
          margin:const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: 
          BorderRadius.circular(20),
          color: Color.fromARGB(179, 163, 162, 162)),
            height: 200,),
      ),)),
      
    );
  }
}