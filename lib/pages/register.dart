import 'package:flutter/material.dart';
import 'package:gym/pages/goal.dart';
import 'package:gym/pages/login.dart';
class Register extends StatelessWidget {
    Register({ Key? key }) : super(key: key);


TextEditingController _email =TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _age =TextEditingController();
TextEditingController _name =TextEditingController();
TextEditingController _height = TextEditingController();
TextEditingController _weight =TextEditingController();
TextEditingController _gender = TextEditingController();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            
            
               padding:const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
            
             [
        
                  const Center(child: Text("Register please",style: TextStyle(fontSize: 20),)),
                  
                  
          
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
                    const SizedBox(height: 20,),
                    TextFormField(
                      
                      controller: _name,
                      keyboardType:
                          TextInputType.name,
                    validator: (value) {
                        if (value!.isEmpty)
                          return "Enter valid name";
                      },
                      decoration: InputDecoration(
                          hintText: "username",
                           
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
        
                     
                     const SizedBox(height: 20,),
                    TextFormField(
                      
                      controller: _age,
                      keyboardType:
                          TextInputType.number,
                    validator: (value) {
                        if (value!.isEmpty)
                          return "Enter valid age";
                      },
                      decoration: InputDecoration(
                          hintText: "age",
                           
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
                      const SizedBox(height: 20,),
                    TextFormField(
                      
                      controller: _weight,
                      keyboardType:
                          TextInputType.number,
                    validator: (value) {
                        if (value!.isEmpty)
                          return "Enter valid weight";
                      },
                      decoration: InputDecoration(
                          hintText: "weight",
                           
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
        
        
                   
                      const SizedBox(height: 20,),
                    TextFormField(
                      
                      controller: _height,
                      keyboardType:
                          TextInputType.number,
                    validator: (value) {
                        if (value!.isEmpty)
                          return "Enter valid height";
                      },
                      decoration: InputDecoration(
                          hintText: "height",
                           
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
                    
                      const SizedBox(height: 20,),
                    TextFormField(
                      
                      controller: _gender,
                      keyboardType:
                          TextInputType.text,
                    validator: (value) {
                        if (value!.isEmpty)
                          return "Enter valid gender";
                      },
                      decoration: InputDecoration(
                          hintText: "gender",
                           
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
                          // if (_formKey.currentState!.validate()){
                            
                          // }
                               
                             
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Goal()));
                       
                             
                        }, child:const Text("Register"),
        
                                     
                     
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                       
                             
                          
                        }, child:const Text("Login"),
        
                                     
                     
                    )
                    
                    
                    
                    
                    
          ],
          
          )
          ),
          
              ),]
            )
            ),
        )
          )
          );
  
  
  }
  
}