part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authorized extends AuthState {
  final UserData user;

  const Authorized(this.user);
}

class Unauthorized extends AuthState {}
