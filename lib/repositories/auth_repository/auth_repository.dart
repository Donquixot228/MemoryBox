import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memorybox2/cubits/auth_cubit/signup_cubit.dart';
import 'package:provider/src/provider.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// -- Start  sign anon
  Future<User?> signInAnon() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User user = userCredential.user!;
      return user;
    } catch (e) {
      return null;
    }
  }

// -- End  sign anon

  // -- Start SignOut Acc
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// -- End SignOut Acc

// -- Start Delete Acc
  Future<void> deleteAcc() async {
    await _firebaseAuth.currentUser!.delete();
  }

// -- End Delete Acc

// -- Start Verification-Phone
  Future verifyPhone(BuildContext context, String phone) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 120),
          verificationFailed: (FirebaseException error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error.code)));
          },
          codeSent: (String vereficationId, int? forceResendingToken) {
            context.read<SignupCubit>().verIdChanged(vereficationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// -- End Verification-Phone Acc

// -- Start Verification-SMS-Code
  Future verifyPin({required String pin, required String verId}) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

// -- End Verification-SMS-Code Acc

// --  UPDATE USER PHONE in PROFILE PAGE

  Future verifyProfilePhone(String phone) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 120),
          verificationFailed: (FirebaseException error) {},
          codeSent: (String vId, int? forceResendingToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {},
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {});
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future verifyPinAndUpdatePhone(
      {required String pin, required String verId}) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);
      await _firebaseAuth.currentUser!.updatePhoneNumber(credential);
    } catch (e) {
      print(e.toString());
    }
  }
}
