import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../api/users_api.dart';

enum LoginProvider { google }

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  static User? get currentUser => firebaseAuth.currentUser;

  static Future<void> signIn(LoginProvider provider) async {
    late final UserCredential userCredential;

    switch (provider) {
      case LoginProvider.google:
        await googleSignIn.initialize();
        final googleUser = await googleSignIn.authenticate();
        final googleAuth = googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        userCredential = await firebaseAuth.signInWithCredential(credential);
        break;
    }

    final user = userCredential.user;
    if (user != null) {
      await UsersApi.upsertMe(
        provider: provider.name,
        providerUserId: user.uid,
        nickname: user.displayName,
        profileImageUrl: user.photoURL,
      );
    }
  }

  static Future<void> signOut(LoginProvider provider) async {
    await firebaseAuth.signOut();

    switch (provider) {
      case LoginProvider.google:
        await googleSignIn.signOut();
        break;
    }
  }
}
