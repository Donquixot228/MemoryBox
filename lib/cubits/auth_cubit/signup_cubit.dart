import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorybox2/repositories/auth_repository/auth_repository.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  // -- Start phoneChanged
  void phoneChanged(String value) {
    emit(
      state.copyWith(
        phone: value,
        status: SignupStatus.initial,
      ),
    );
  }

  // -- End  phoneChanged

  // -- Start verIdChanged
  void verIdChanged(String value) {
    emit(
      state.copyWith(
        verId: value,
        status: SignupStatus.initial,
      ),
    );
  }

  // -- End verIdChanged

  // -- Start smsCodeChanged

  void smsCodeChanged(String value) {
    emit(
      state.copyWith(
        smsCode: value,
        status: SignupStatus.initial,
      ),
    );
  }

  // -- End Sign smsCodeChanged

  // -- Start Sign in anon
  void signUpAnon() {
    _authRepository.signInAnon();
    emit(state.copyWith(status: SignupStatus.anon));
  }

  // -- End Sign in anon

  // -- Start verifyPhone
  void verifyPhone(BuildContext context) async {
    try {
      await _authRepository.verifyPhone(context, state.phone);
      emit(state.copyWith(status: SignupStatus.initial));
    } catch (_) {}
  }

  // -- End verifyPhone
  // -- Start signupAndVerifyCode
  Future<void> signupAndVerifyCode(BuildContext context) async {
    if (!state.isValid) return;
    try {
      await _authRepository.verifyPin(pin: state.smsCode, verId: state.verId);
      emit(state.copyWith(status: SignupStatus.success));

    } catch (_) {}
  }
// -- End signupAndVerifyCode

  //update PhoneNumber
  void updatePhoneNumber(BuildContext context) async {
    if (!state.isValid) return;
    try {
      await _authRepository.verifyPin(pin: state.smsCode, verId: state.verId);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }



}
