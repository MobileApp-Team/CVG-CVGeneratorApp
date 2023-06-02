part of 'project_bloc.dart';

@immutable
abstract class ProjectEvent {}

class SaveProjectEvent extends ProjectEvent {}

// class SaveProjectEvent extends ProjectEvent {}

//   const ProjectEvent();

//   @override
//   List<Object> get props => [];
// }

// class ProjectTitleChanged extends ProjectEvent {
//   final String projectTitle;

//   const ProjectTitleChanged({required this.projectTitle});

//   @override
//   List<Object> get props => [projectTitle];
// }

// class ProjectDescriptionChanged extends ProjectEvent {
//   final String projectDescription;

//   const ProjectDescriptionChanged({required this.projectDescription});

//   @override
//   List<Object> get props => [projectDescription];
// }

// class ProjectSaved extends ProjectEvent {}