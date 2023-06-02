// import 'package:flutter/material.dart';
// import 'package:flutter_app4/personal_detail/personal_detail.dart';
// import 'package:flutter_app4/personal_detail/personal_detail_bloc.dart';
// import 'package:flutter_app4/router.dart';
// import 'dart:ui';
// import 'package:flutter_app4/Login.dart';
import 'package:flutter_project/Login.dart';

import 'profile/profile2.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(MultiBlocProvider(providers: [
//     BlocProvider<PersonalDetailBloc>(
//       create: (BuildContext context) => PersonalDetailBloc(),
//     ),
//   ], child: const MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
//       ),
//       title: "CVG",
//       routeInformationParser: AppRouter().router.routeInformationParser,
//       routerDelegate: AppRouter().router.routerDelegate,
//       // home: const ProfilePage(),
//       // home: const ExperiencePage(),
//       // home: Others(),
//       // home: TemplatePage(),
//       // home: ProjectPage(),
//       // home: PersonalDetail(),
//       // home: LoginPage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'profile/profile.dart';
// import 'package:/Home.dart';
// import 'package:fontend/Login.dart';
// import 'package:fontend/ResumePages/CareerObjective.dart';
// import 'package:fontend/ResumePages/EducationalQual.dart';
// import 'package:fontend/ResumePages/ResumePage.dart';
// import 'package:fontend/Signup.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'ResumePages/DisplayScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preffs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: preffs.getString('token'),
  ));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, @required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'CV GEN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const DisplayPage(),
      home: ((token == null)? const Login() : (JwtDecoder.isExpired(token)==false)? ProfilePage(token: token): const Login()),
    );
  }
}
