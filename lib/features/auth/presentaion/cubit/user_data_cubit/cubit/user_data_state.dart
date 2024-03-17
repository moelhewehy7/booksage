part of 'user_data_cubit.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataSuccess extends UserDataState {
  final Map<String, dynamic>? userData;
  const UserDataSuccess({required this.userData});
}

class UserDataFailure extends UserDataState {}

class UpdateUserDataLoading extends UserDataState {}

class UpdateUserDataSuccess extends UserDataState {}
