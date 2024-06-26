import 'package:calendar_app/utils/googleAccessToken.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';

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
      final GoogleSignInAccount? gUser = await GoogleSignIn(scopes: [
        'email',
        CalendarApi.calendarScope,
      ]).signIn();

      if (gUser == null) {
        throw FirebaseAuthException(
          code: 'user-cancelled',
          message: 'User cancelled the sign-in flow',
        );
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      await saveAccessToken(gAuth.accessToken!);

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
