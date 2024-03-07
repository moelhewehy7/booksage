part of 'user_data_cubit.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

class UserDataLoaded extends UserDataState {
  // final Map<String, dynamic>? userData;

  // const UserDataLoaded({required this.userData});
}

class UserDatafailure extends UserDataState {
  final String error;

  const UserDatafailure({required this.error});
}

class UserDataLoading extends UserDataState {}

class FetchUserDataloaded extends UserDataState {
  final Map<String, dynamic>? userData;

  const FetchUserDataloaded({required this.userData});
}
