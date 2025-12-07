import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  static User? get currentUser => firebaseAuth.currentUser;

  static Future<UserCredential> signInWithGoogle() async {
    await googleSignIn.initialize();
    final googleUser = await googleSignIn.authenticate();
    final googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return firebaseAuth.signInWithCredential(credential);
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
