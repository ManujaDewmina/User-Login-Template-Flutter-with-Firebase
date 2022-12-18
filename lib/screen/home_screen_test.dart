import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_and_up_flutter/screen/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String? email = currentUser?.email;
      return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    email!,
                    style: TextStyle(color: Colors.white, fontSize: 17)
                ),
                ElevatedButton(
                    child: const Text("Logout"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      });
                    }
                )
              ]
          )
      );
  }
}


