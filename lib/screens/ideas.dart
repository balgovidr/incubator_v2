import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';

class Ideas extends StatefulWidget {
  @override
  _IdeasState createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    // Retreiving required data;
    Map<String, dynamic> profileData = DatabaseManager().getUserData(user.uid);

    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("IDEAS"),
          Text(profileData["firstName"]),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Sign out"),
          ),
        ]),
      ),
    );
  }
}
