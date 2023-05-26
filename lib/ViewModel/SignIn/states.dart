abstract class SignInState {}

class SignInInit extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String? msg;
  SignInSuccess({this.msg});
}

class SignInError extends SignInState {
  final String? msgErr;
  SignInError({this.msgErr});
}
