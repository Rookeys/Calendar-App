import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuthException handleAuthException(FirebaseAuthException e) {
  if (e.code == 'user-cancelled') {
    return FirebaseAuthException(
      code: 'user-cancelled',
      message: 'User cancelled the sign-in flow',
    );
  } else if (e.code == 'invalid-email-domain') {
    return FirebaseAuthException(
      code: 'invalid-email-domain',
      message:
          'Only users with email addresses from [icloudhospital.com] are allowed to sign in',
    );
  } else {
    return FirebaseAuthException(
      code: 'login-failed',
      message: 'Login failed: ${e.message}',
    );
  }
}

class AuthService {
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        throw FirebaseAuthException(
          code: 'user-cancelled',
          message: 'User cancelled the sign-in flow',
        );
      }

      final allowedDomains = ['icloudhospital.com'];
      final emailDomain = gUser.email.split('@').last;
      if (!allowedDomains.contains(emailDomain)) {
        throw FirebaseAuthException(
          code: 'invalid-email-domain',
        );
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw handleAuthException(e);
    } catch (e) {
      throw FirebaseAuthException(
        code: 'login-failed',
        message: 'Login failed',
      );
    }
  }
}
