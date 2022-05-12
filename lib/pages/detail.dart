import 'package:flutter/material.dart';
class Detail extends StatelessWidget {
  const Detail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Detail")),
       body: SafeArea(
         child: Container(
           padding: const EdgeInsets.all(10),
           child: Column(
             children: [
               Container(
                 child: Column(
                   
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Container(
                        
                       color:const Color.fromARGB(255, 202, 202, 202),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         IconButton(onPressed: (){}, icon:Icon( Icons.play_arrow_outlined))
                       ,IconButton(onPressed: (){}, icon:Icon( Icons.fullscreen)),
                       IconButton(onPressed: (){}, icon:Icon( Icons.volume_down))
                       ],),
                     )
                   ],
                 ),
                 width:MediaQuery.of(context).size.width,
                 height: 200,
                color: const Color.fromARGB(255, 168, 168, 168),
               ),
               Wrap(children: [
                 Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  comes from a line in section 1.10.32Sections 1.10.32 and 1.10.33 from    by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.")
               ],)
             ],
           ),
         ),
       ),
      
    );
  }
}