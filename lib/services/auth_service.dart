import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google sign in
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // User cancelled the sign-in flow
        throw FirebaseAuthException(
          code: 'user-cancelled',
          message: 'User cancelled the sign-in flow',
        );
      }

      // Check if the user's email domain is allowed
      final allowedDomains = ['icloudhospital.com'];
      final emailDomain = gUser.email.split('@').last;
      if (!allowedDomains.contains(emailDomain)) {
        // User's email domain is not allowed
        throw FirebaseAuthException(
          code: 'invalid-email-domain',
          message:
              'Only users with email addresses from $allowedDomains are allowed to sign in',
        );
      }

      // create auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // create a new credential for use
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // finally lets sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      if (e.code == 'user-cancelled') {
        // User cancelled the sign-in flow
        print('User cancelled the sign-in flow');
        // throw 'User cancelled the sign-in flow';
      } else {
        // Other FirebaseAuthException
        print('FirebaseAuth`Exception: ${e.message}');
        // throw 'FirebaseAuth`Exception: ${e.message}';
      }
      rethrow;
    } catch (e) {
      // Handle other exceptions
      print('Exception: $e');
      throw 'Exception: error signing in with google';
    }
  }
}
