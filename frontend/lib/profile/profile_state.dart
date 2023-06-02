part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Icon> icons;

  ProfileLoaded({required this.icons});
}

class ProfileError extends ProfileState {}