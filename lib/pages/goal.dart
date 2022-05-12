import 'package:flutter/material.dart';
import 'package:gym/pages/Home.dart';

class Goal extends StatelessWidget {
  const Goal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [
           const Center(child: Text("What is your main goal",style: TextStyle(fontSize: 20),)),
                   TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                              
                           
                        
                      }, child:const Text("Weight Loose"),

                                   
                   
                  ),
                   TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                              
                           
                        
                      }, child:const Text("Weight Gain"),

                                   
                   
                  ),
                   TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                              
                           
                        
                      }, child:const Text("Mantain Body Muscle"),

                                   
                   
                  )
          ],),
        ),
      ),
      
    );
  }
}