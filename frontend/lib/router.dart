import 'package:flutter/material.dart';
import 'package:flutter_project/model/user_model.dart';
import 'package:flutter_project/profile/profile.dart';
import 'package:go_router/go_router.dart';

import 'experience/experience.dart';
import 'login.dart';
import 'others/others.dart';
import 'personal_detail/personal_detail.dart';
import './template/template_page.dart';
import 'profile/profile2.dart';
import './project/project_page.dart';
import './Signup.dart';
import 'service/database_helper.dart';


class AppRouter {
  final DatabaseHelper db = DatabaseHelper();
  Future<List<UserModelPersonalDetail>> data = instance.queryAllpersonalDetail();
  
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Login(),
          );
        },
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ProfilePage(),
          );
        },
      ),
      GoRoute(
        path: '/profile/personal_detail',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: PersonalDetail(),
          );
        },
      ),
      GoRoute(
        path: '/profile/project',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ProjectPage(),
          );
        },
      ),
      GoRoute(
        path: '/profile/others',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Others(),
          );
        },
      ),
      GoRoute(
        path: '/profile/experience',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ExperiencePage(
              navigatorKey: GlobalKey(),
            ),
          );
        },
      ),
      GoRoute(
        path: '/template',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: TemplatePage(),
          );
        },
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Signup(),
          );
        },
      ),
      
      // GoRoute(
      //   path: '/profile/display',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //       child: Display(
      //         data: UserModelPersonalDetail(id: 2, fullName: "fullName", email: "email", profession: "profession", phoneNumber: "phoneNumber", country: "country", city: "city"),
      //       ),
      //     );
      //   },
      // ),
      // redirect: (context, state) async {
      //   bool isAuthenticated = false;
      //   if(!isAuthenticated && state.subloc == '/'){
      //     return '/login'
      //   }
      //   return Null
      // }
    ],
  );
}
