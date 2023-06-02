import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/experience/experience.dart';
import 'package:flutter_project/personal_detail/personal_detail.dart';
// import 'package:go_router/go_router.dart';
import '../project/project_page.dart';
import '../template/template_page.dart';
import 'profile2.dart';
// import '../personal_detail.dart';
// import '../project/project_page.dart';
import '../others/others.dart';
// import '../Login.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class Icon {
  final IconData iconData;
  final String label;
  final Widget page;

  Icon({required this.iconData, required this.label, required this.page});
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield ProfileLoading();
      try {
        final icons = [
          Icon(
            iconData: Icons.work,
            label: 'Experience',
            page: ExperiencePage(
              navigatorKey: GlobalKey(),
            ),
          ),
          Icon(
            iconData: Icons.person,
            label: 'Personal Details',
            page: const PersonalDetail(),
          ),
          Icon(
            iconData: Icons.code,
            label: 'Projects',
            page: const ProjectPage(),
          ),
          Icon(
            iconData: Icons.widgets,
            label: 'project',
            page: const Others(),
          ),
        ];

        yield ProfileLoaded(icons: icons);
      } catch (e) {
        yield ProfileError();
      }
    }
  }
}
