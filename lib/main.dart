import 'package:flutter/material.dart';
import 'package:incubator_v2/screens/homepage.dart';
import 'package:incubator_v2/themes.dart';
import 'package:incubator_v2/services/authentication_service.dart';
import 'package:incubator_v2/screens/ideas.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            initialData: null,
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: MaterialApp(
            title: 'Incubator',
            theme: CustomTheme.darkTheme,
            home: AuthenticationWrapper()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Ideas();
    }
    return Homepage();
  }
}
