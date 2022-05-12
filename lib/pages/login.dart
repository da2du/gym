import 'package:flutter/material.dart';
import 'package:gym/pages/register.dart';
class Login extends StatelessWidget {
    Login({ Key? key }) : super(key: key);

  
TextEditingController _email =TextEditingController();
TextEditingController _password = TextEditingController();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Container(
          
          
             padding:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
          
           [

                Center(child: Text("Login please",style: TextStyle(fontSize: 20),)),
                
                
        
                Form(
          key: _formKey,
          child: Container(
             
            width: 500,
            margin:
                const EdgeInsets.symmetric(vertical: 20),
            child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    
                    controller: _email,
                    keyboardType:
                        TextInputType.emailAddress,
                  validator: (value) {
                      if (value!.isEmpty)
                        return "Enter valid email";
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                         
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(60),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Enter valid password";
                    },
                    controller: _password,
                    keyboardType:
                        TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                     
                         
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(60),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        if (_formKey.currentState!.validate()){
                          
                        }
                             
                           
                        
                      }, child:const Text("Login"),

                                   
                   
                  ),
                  
                  
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                              
                           
                        
                      }, child:const Text("Register"),

                                   
                   
                  )
                  
                  
                  
                  
                  
        ],
        
        )
        ),
        
      ),]
          )
          )
          )
          );
  
  
  }
  
}