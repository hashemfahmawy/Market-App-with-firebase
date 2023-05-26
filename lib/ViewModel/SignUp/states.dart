abstract class SignUpState {}

class SignUpInit extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String? msg;
  SignUpSuccess({this.msg});
}

class SignUpError extends SignUpState {
  final String? msgErr;
  SignUpError({this.msgErr});
}

class SignUpPickDateState extends SignUpState {}
