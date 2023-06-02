part of 'project_bloc.dart';

@immutable
abstract class ProjectStateBloc {}

class ProjectInitial extends ProjectStateBloc {}
class ProjectSavedState extends ProjectStateBloc {}

//   const ProjectState();

//   @override
//   List<Object> get props => [];
// }

// class ProjectInitial extends ProjectState {}

// class ProjectSaving extends ProjectState {}

// class ProjectSavedSuccess extends ProjectState {}

// class ProjectSavedFailure extends ProjectState {
//   final String message;

//   const ProjectSavedFailure({required this.message});

//   @override
//   List<Object> get props => [message];
// }