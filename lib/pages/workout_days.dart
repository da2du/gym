import 'package:flutter/material.dart';
class WorkoutDays extends StatelessWidget {
  const WorkoutDays({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(padding:const EdgeInsets.all(20),
      child: Column(children:const [
          Center(child: Text("Workout Days",style: TextStyle(fontSize: 20),)),
             

      ],),
      )),
      
    );
  }
}