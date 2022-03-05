part of 'signup_cubit.dart';

enum SignupStatus { initial, success ,anon}

class SignupState extends Equatable {
  final String verId;
  final String phone;
  final String smsCode;
  final SignupStatus status;

  const SignupState(
      {required this.verId,
      required this.phone,
      required this.smsCode,
      required this.status});

  factory SignupState.initial() {
    return SignupState(
      verId: '',
      phone: '',
      smsCode: '',
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? verId,
    String? phone,
    String? smsCode,
    SignupStatus? status,
  }) {
    return SignupState(
      verId: verId ?? this.verId,
      phone: phone ?? this.phone,
      smsCode: smsCode ?? this.smsCode,
      status: status ?? this.status,
    );
  }

  bool get isValid => phone.isNotEmpty && smsCode.isNotEmpty;

  @override
  // TODO: implement props
  List<Object?> get props => [
        verId,
        phone,
        smsCode,
        status,
      ];
}
