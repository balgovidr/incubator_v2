import 'package:flutter/material.dart';
import 'package:incubator_v2/services/authentication_service.dart';
import 'package:provider/provider.dart';

class Ideas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("IDEAS"),
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
