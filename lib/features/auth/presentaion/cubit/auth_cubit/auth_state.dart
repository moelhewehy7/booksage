part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFaliure extends AuthState {
  final String title;
  final String content;
  final String text;
  const LoginFaliure({
    required this.title,
    required this.content,
    required this.text,
  });
}

class SignupLoading extends AuthState {}

class SignupSuccess extends AuthState {}

class Signupfailure extends AuthState {
  final String title;
  final String content;
  final String text;
  const Signupfailure({
    required this.title,
    required this.content,
    required this.text,
  });
}

class ResetpasswordLoading extends AuthState {}

class ResetpasswordSuccess extends AuthState {
  final String title;
  final String content;
  final String buttonText;
  const ResetpasswordSuccess({
    required this.title,
    required this.content,
    required this.buttonText,
  });
}

class Resetpasswordfailure extends AuthState {
  final String title;
  final String content;
  final String buttonText;
  const Resetpasswordfailure({
    required this.title,
    required this.content,
    required this.buttonText,
  });
}

class UserDataLoaded extends AuthState {
  final Map<String, dynamic>? userData;

  const UserDataLoaded({required this.userData});
}

class UserDatafailure extends AuthState {
  final String error;

  const UserDatafailure({required this.error});
}
