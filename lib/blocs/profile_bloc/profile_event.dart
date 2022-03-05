part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileEdit extends ProfileEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ProfileSave extends ProfileEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProfileEditName extends ProfileEvent{
  String name;
  ProfileEditName(this.name);
  @override
  List<Object?> get props => [name];
}
class ProfileUpdatePhoto extends ProfileEvent{
  ProfileUpdatePhoto(this.file);
  File file;
  @override
  List<Object?> get props => [];
}

class ProfileSetNewPhoneNumber extends ProfileEvent{
  ProfileSetNewPhoneNumber(this.phone);
  String phone;
  @override
  List<Object?> get props => [phone];
}
class UpdateSetNewPhoneNumber extends ProfileEvent{
  UpdateSetNewPhoneNumber(this.pin,this.phone);
  String pin;
  String phone;
  @override
  List<Object?> get props => [pin,phone];
}
class SignOut extends ProfileEvent{
  SignOut();
  @override
  List<Object?> get props => [];
}
class DeleteAcc extends ProfileEvent{
  DeleteAcc();
  @override
  List<Object?> get props => [];
}