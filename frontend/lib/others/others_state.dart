part of 'others_bloc.dart';

@immutable
abstract class OthersStateBloc {}

class OthersInitial extends OthersStateBloc {}
class OthersSavedState extends OthersStateBloc {}

// part of 'others_bloc.dart';

// @immutable
// abstract class OthersState extends Equatable {
//   const OthersState();

//   @override
//   List<Object?> get props => [];
// }

// class OthersInitial extends OthersState {}

// class OthersLoaded extends OthersState {
//   final List<String> skills;
//   final String education;
//   final String additionalInfo;

//   OthersLoaded({
//     required this.skills,
//     required this.education,
//     required this.additionalInfo,
//   });

//   @override
//   List<Object?> get props => [skills, education, additionalInfo];
// }

