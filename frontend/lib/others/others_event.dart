part of 'others_bloc.dart';

@immutable
abstract class OthersEvent {}

class SaveOthersEvent extends OthersEvent {}
// part of 'others_bloc.dart';

// @immutable
// abstract class OthersEvent extends Equatable {
//   const OthersEvent();

//   @override
//   List<Object?> get props => [];
// }

// class AddSkillEvent extends OthersEvent {
//   final String skill;

//   AddSkillEvent(this.skill);

//   @override
//   List<Object?> get props => [skill];
// }

// class AddEducationEvent extends OthersEvent {
//   final String description;

//   AddEducationEvent(this.description);

//   @override
//   List<Object?> get props => [description];
// }

// class AddAdditionalInfoEvent extends OthersEvent {
//   final String description;

//   AddAdditionalInfoEvent(this.description);

//   @override
//   List<Object?> get props => [description];
// }

