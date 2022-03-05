import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';

import '../../repositories/auth_repository/auth_repository.dart';



part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataBaseRepository _dataBaseRepository;
  final AuthRepository _authRepository = AuthRepository();

  ProfileBloc({required DataBaseRepository dataBaseRepository})
      : _dataBaseRepository = dataBaseRepository,
        super(ProfileInitial()) {
    on<ProfileEdit>((event, emit) {
      emit(ProfileEditing());
    });
    on<ProfileSave>((event, emit) {
      emit(ProfileInitial());
    });
    on<ProfileEditName>((event, emit) {
      _dataBaseRepository.updateUserName(data: event.name);
    });
    on<ProfileUpdatePhoto>((event, emit) {
      _dataBaseRepository.updateUserPhoto(file: event.file);
    });
    on<ProfileSetNewPhoneNumber>((event, emit) {
      _authRepository.verifyProfilePhone(event.phone);
    });
    on<UpdateSetNewPhoneNumber>((event, emit) async {
      await _authRepository
          .verifyPinAndUpdatePhone(
              pin: event.pin, verId: _dataBaseRepository.state.uid)
          .then((value) =>
              _dataBaseRepository.updateUserPhone(phone: event.phone));
    });
    on<SignOut>((event, emit) async {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser!.isAnonymous == true) {
        await _authRepository
            .deleteAcc()
            .then((val) => _dataBaseRepository.clearAllDataInFB());
      } else {
        _authRepository.signOut();
      }
    });

    on<DeleteAcc>((event, emit) async {
      await _authRepository
          .deleteAcc()
          .then((val) => _dataBaseRepository.clearAllDataInFB());
    });
  }
}
