// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class GridState {
//   final List<String> tileTexts; // new property for tile texts
//   final List<IconData> tileIcons; // new property for tile icons

//   GridState({required this.tileTexts, required this.tileIcons});

//   GridState update({List<String>? tileTexts, List<IconData>? tileIcons}) {
//     return GridState(
//       tileTexts: tileTexts ?? this.tileTexts,
//       tileIcons: tileIcons ?? this.tileIcons,
//     );
//   }
// }

// class GridBloc extends Cubit<GridState> {
//   GridBloc()
//       : super(GridState(
//           tileTexts: [
//             'Personal detail',
//             'experience',
//             'Projects',
//             'Others',
//           ],
//           tileIcons: [
//             Icons.person,
//             Icons.work,
//             Icons.code,
//             Icons.widgets,
//           ],
//         ));

//   void updateTile(int index, String newText, IconData newIcon) {
//     final List<String> updatedTexts = state.tileTexts.toList();
//     updatedTexts[index] = newText;

//     final List<IconData> updatedIcons = state.tileIcons.toList();
//     updatedIcons[index] = newIcon;

//     final GridState updatedState =
//         state.update(tileTexts: updatedTexts, tileIcons: updatedIcons);
//     emit(updatedState);
//   }
// }

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final _gridBloc = GridBloc();

//   @override
//   void dispose() {
//     _gridBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _gridBloc,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Profile'),
//         ),
//         body: DecoratedBox(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/coverPhoto.jpg"), fit: BoxFit.cover),
//           ),
//           child: Container(
//             // padding: const EdgeInsets.all(20),
//             // padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
//             child: BlocBuilder<GridBloc, GridState>(
//               builder: (context, state) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: <Widget>[
//                     Expanded(
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 20,
//                         crossAxisSpacing: 20,
//                         padding: const EdgeInsets.all(16),
//                         children: List.generate(
//                           4,
//                           (index) {
//                             return GridTile(
//                               child: Container(
//                                 color: Colors.brown,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       state.tileIcons[index],
//                                       size: 30,
//                                       color: Colors.white,
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text(
//                                       state.tileTexts[index],
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         // fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
                                  
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //  *******************************************

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // import './profile_bloc.dart';
// // // import './profile_state.dart';

// // class profileScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('profile View'),
// //       ),
// //       body: BlocBuilder<profileBloc, profileState>(
// //         builder: (context, state) {
// //           if (state is profileLoading) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (state is profileLoaded) {
// //             return profileView.count(
// //               crossAxisCount: 2,
// //               children: state.icons
// //                   .map((icon) => Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Icon(icon.iconData, size: 48),
// //                           SizedBox(height: 16),
// //                           Text(icon.label, style: TextStyle(fontSize: 18)),
// //                         ],
// //                       ))
// //                   .toList(),
// //             );
// //           } else {
// //             return Center(child: Text('Failed to load profile data.'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// // *********************************************************************************************

// // import 'package:flutter/material.dart';

// // class ProfilePage extends StatefulWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Profile')),
// //       body: DecoratedBox(
// //         decoration: const BoxDecoration(
// //           image: DecorationImage(
// //               image: AssetImage("images/coverPhoto.jpg"), fit: BoxFit.cover),
// //         ),
// //         child: Container(
// //           padding: const EdgeInsets.all(80),
// //           child: Center(
// //             child: Column(

// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 const Text('Welcome!!!'),
// //                 const Spacer(),
// //                 Row(
// //                   children: [
// //                     Container(
// //                       margin: const EdgeInsets.all(20.0),
// //                       padding: const EdgeInsets.all(20.0),
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           color: Colors.brown),
// //                       child: Column(
// //                         children: const [
// //                           Icon(Icons.person, color: Colors.white),
// //                           Text(
// //                             'Personal Detail',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontSize: 15),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
                    
// //                     Container(
// //                       margin: const EdgeInsets.all(20.0),
// //                       padding: const EdgeInsets.all(20.0),
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           color: Colors.brown),
// //                       child: Column(
// //                         children: const [
// //                           Icon(Icons.work, color: Colors.white),
// //                           Text(
// //                             'Experience',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontSize: 15),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
                    
// //                   ],
// //                 ),
                
// //                 Row(
// //                   children: [
// //                     Container(
// //                       margin: const EdgeInsets.all(20.0),
// //                       padding: const EdgeInsets.all(30.0),
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           color: Colors.brown),
// //                       child: Column(
// //                         children: const [
// //                           Icon(Icons.code, color: Colors.white),
// //                           Text(
// //                             'Project',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontSize: 15),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
                    
                    
// //                     Container(
// //                       margin: const EdgeInsets.all(20.0),
// //                       padding: const EdgeInsets.all(30.0),
// //                       decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8),
// //                           color: Colors.brown),
// //                       child: Column(
// //                         children: const [
// //                           Icon(Icons.widgets, color: Colors.white),
// //                           Text(
// //                             'Others',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontSize: 15),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
                    
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
