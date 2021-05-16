import 'package:flutter/material.dart';
import 'package:incubator_v2/services/authentication_service.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: screenHeight,
            color: const Color(0xFF333333),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/logo.png')),
                Text(
                  'INCUBATOR',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: signInEmailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Email'),
                    )),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: signInPasswordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Password'),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          child: Text('Login'),
                          onPressed: () {
                            context.read<AuthenticationService>().signIn(
                                  email: signInEmailController.text.trim(),
                                  password:
                                      signInPasswordController.text.trim(),
                                );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          child: Text('Signup'),
                          onPressed: () {
                            print('Signup pressed');
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              height: screenHeight,
              child: Column(
                children: [
                  Text('Register'),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First name'),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last name'),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Email'),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Password'),
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Repeat password'),
                      )),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        child: Text('Signup'),
                        onPressed: () {
                          print("signup pressed");
                        }),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
