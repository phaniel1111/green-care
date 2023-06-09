import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            GoogleSignIn().disconnect();
          }, icon: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).colorScheme.primary,
          ),
          ),
        ],
      ),
      body: Center(
        child: Text("Text",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
