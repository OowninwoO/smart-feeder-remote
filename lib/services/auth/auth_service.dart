import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/users_api.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  static User? get currentUser => firebaseAuth.currentUser;

  static Future<String?> get idToken async {
    if (currentUser == null) return null;
    return await currentUser!.getIdToken();
  }

  static Future<void> signInWithGoogle() async {
    await googleSignIn.initialize();
    final googleUser = await googleSignIn.authenticate();
    final googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user;
    if (user != null) {
      await UsersApi.upsertMe(
        nickname: user.displayName,
        profileImageUrl: user.photoURL,
      );
    }
  }

  static Future<void> signOut() async {
    final providerId = currentUser!.providerData.first.providerId;

    await firebaseAuth.signOut();

    switch (providerId) {
      case 'google.com':
        await googleSignIn.signOut();
        break;
      default:
        break;
    }
  }
}
