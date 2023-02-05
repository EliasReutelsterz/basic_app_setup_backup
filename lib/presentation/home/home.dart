import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Text("HomePage"),
            TextButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("test")
                      .doc("testString")
                      .set({
                    "random": "does it work?",
                  });
                },
                child: Text("Insert something")),
          ],
        ),
      ),
    );
  }
}
