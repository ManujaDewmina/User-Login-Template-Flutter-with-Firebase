import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_and_up_flutter/screen/home_screen_test.dart';

import '../Utils/color_utils.dart';
import '../reusable_widgets/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

    final TextEditingController _passwordTextController = TextEditingController();
    final TextEditingController _emailTextController = TextEditingController();
    final TextEditingController _userNameTextController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    //hexStringToColor("FFFFFF"),
                    hexStringToColor("15184F"),
                    hexStringToColor("15184F"),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Column(
                children: <Widget>[
                  reusableTextField("Enter UserName", Icons.person_outlined, false, _userNameTextController),
                  const SizedBox(height: 20,),
                  reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),
                  const SizedBox(height: 20,),
                  reusableTextField("Enter Password", Icons.lock_outlined, true, _passwordTextController),
                  const SizedBox(height: 20,),
                  signInSignUpButton(context, false, (){
                    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text
                    ).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    });
                  })
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
