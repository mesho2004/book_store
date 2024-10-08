abstract class AuthStates{}

class AuthInitState extends AuthStates{}

class loginInitState extends AuthStates{}

class loginLoadingState extends AuthStates{}

class loginSuccessState extends AuthStates{}

class loginErrorState extends AuthStates{
  final String error;
  loginErrorState(this.error);
}

class registerInitState extends AuthStates{}

class registerLoadingState extends AuthStates{}

class registerSuccessState extends AuthStates{}

class registerErrorState extends AuthStates{}

