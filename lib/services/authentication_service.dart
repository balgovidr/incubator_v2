import 'package:firebase_auth/firebase_auth.dart';
import 'package:incubator_v2/services/database_manager.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String> signUp(
      {String firstName,
      String lastName,
      String email,
      String password}) async {
    // _formKey.currentState.save();
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await result.user.sendEmailVerification();
      User user = result.user;
      await DatabaseManager().createUserData(firstName, lastName, user.uid);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //  verificationEmail() {
  //    final User user = _firebaseAuth.currentUser;
  //       user.sendEmailVerification()
  //               .onComplete(this, new OnCompleteListener() {
  //                   @Override
  //                   public void onComplete(@NonNull Task task) {
  //                       // Re-enable button
  //                       findViewById(R.id.verify_email_button).setEnabled(true);

  //                       if (task.isSuccessful()) {
  //                           Toast.makeText(EmailPasswordActivity.this,
  //                                   "Verification email sent to " + user.getEmail(),
  //                                   Toast.LENGTH_SHORT).show();
  //                       } else {
  //                           Log.e(TAG, "sendEmailVerification", task.getException());
  //                           Toast.makeText(EmailPasswordActivity.this,
  //                                   "Failed to send verification email.",
  //                                   Toast.LENGTH_SHORT).show();
  //                       }
  //                   }
  //               });
  //  }
}
