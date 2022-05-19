import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym/pages/Home.dart';
import 'package:gym/pages/register.dart';
import 'package:gym/wrapper.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Future firebaseLogin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text, password: _password.text);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(children: [
                  const Center(
                      child: Text(
                    "Login please",
                    style: TextStyle(fontSize: 20),
                  )),
                  Form(
                    key: _formKey,
                    child: Container(
                        width: 500,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) return "Enter valid email";
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Enter valid password";
                              },
                              controller: _password,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  firebaseLogin().whenComplete(() {
                                    FirebaseAuth.instance.currentUser != null
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Wrapper()))
                                        : Login();
                                  });
                                }
                              },
                              child: const Text("Login"),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: const Text("Register"),
                            )
                          ],
                        )),
                  ),
                ]))));
  }
}
