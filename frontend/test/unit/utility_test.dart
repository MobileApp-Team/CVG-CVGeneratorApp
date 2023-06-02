// import 'package:flutter_app4/model/user_model.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('Test user object creation', () {
//     // Create a User object with some sample data
//     UserModelPersonalDetail user = UserModelPersonalDetail(
//       id: 1,
//       fullName: 'John Doe',
//       email: 'johndoe@example.com',
//       phoneNumber: '555-1234',
//       profession: 'software',
//       country: 'Ethiopia',
//       city: 'Addis Ababa'
//     );

//     // Test that the User object was correctly created and contains the expected information
//     expect(user.id, equals('John Doe'));
//     expect(user.fullName, equals('johndoe@example.com'));
//     expect(user.email, equals('555-1234'));
//     expect(user.phoneNumber, equals('123 Main St'));
//     expect(user.profession, equals(['Software Developer, Acme Corporation']));
//     expect(user.country,
//         equals(['Bachelor of Science in Computer Science, University of XYZ']));
//     expect(user.city, equals(['Flutter']));

//   UserModelPersonalDetail user = UserModelPersonalDetail(
//       id: 1,
//       fullName: 'John Doe',
//       email: 'johndoe@example.com',
//       phoneNumber: '555-1234',
//       profession: 'software',
//       country: 'Ethiopia',
//       city: 'Addis Ababa'
//     );

//     // Test that the User object was correctly created and contains the expected information
//     expect(user.id, equals('John Doe'));
//     expect(user.fullName, equals('johndoe@example.com'));
//     expect(user.email, equals('555-1234'));
//     expect(user.phoneNumber, equals('123 Main St'));
//     expect(user.profession, equals(['Software Developer, Acme Corporation']));
//     expect(user.country,
//         equals(['Bachelor of Science in Computer Science, University of XYZ']));
//     expect(user.city, equals(['Flutter']));
//   });


//   });

// // ********************************

//   test('Test user information update', () {
//     // Create a User object with some initial data
//     UserModelPersonalDetail user = UserModelPersonalDetail(
//       id: 1,
//       fullName: 'John Doe',
//       email: 'johndoe@example.com',
//       phoneNumber: '555-1234',
//       address: '123 Main St',
//       experience: [],
//       education: [],
//       skills: [],
//     );

//     // Update the user's information
//     user.name = 'Jane Doe';
//     user.email = 'janedoe@example.com';
//     user.phone = '555-5678';
//     user.address = '456 Second St';

//     // Add some experience, education, and skills to the user's profile
//     user.experience.add('Software Developer, Acme Corporation');
//     user.education
//         .add('Bachelor of Science in Computer Science, University of XYZ');
//     user.skills.add('Flutter');

//     // Test that the user's information was correctly updated in the User object
//     expect(user.name, equals('Jane Doe'));
//     expect(user.email, equals('janedoe@example.com'));
//     expect(user.phone, equals('555-5678'));
//     expect(user.address, equals('456 Second St'));
//     expect(user.experience, equals(['Software Developer, Acme Corporation']));
//     expect(user.education,
//         equals(['Bachelor of Science in Computer Science, University of XYZ']));
//     expect(user.skills, equals(['Flutter']));
//   });

// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:cv_generator/user.dart';

//   test('Test user object creation', () {
//     // Create a User object with some sample data
//     User user = User(
//       name: 'John Doe',
//       email: 'johndoe@example.com',
//       phone: '555-1234',
//       address: '123 Main St',
//       experience: ['Software Developer, Acme Corporation'],
//       education: ['Bachelor of Science in Computer Science, University of XYZ'],
//       skills: ['Flutter'],
//     );

//     // Test that the User object was correctly created and contains the expected information
//     expect(user.name, equals('John Doe'));
//     expect(user.email, equals('johndoe@example.com'));
//     expect(user.phone, equals('555-1234'));
//     expect(user.address, equals('123 Main St'));
//     expect(user.experience, equals(['Software Developer, Acme Corporation']));
//     expect(user.education,
//         equals(['Bachelor of Science in Computer Science, University of XYZ']));
//     expect(user.skills, equals(['Flutter']));
//   });

//   test('Test user information update', () {
//     // Create a User object with some initial data
//     User user = User(
//       name: 'John Doe',
//       email: 'johndoe@example.com',
//       phone: '555-1234',
//       address: '123 Main St',
//       experience: [],
//       education: [],
//       skills: [],
//     );

//     // Update the user's information
//     user.name = 'Jane Doe';
//     user.email = 'janedoe@example.com';
//     user.phone = '555-5678';
//     user.address = '456 Second St';
//     // Add some experience, education, and skills to the user's profile
//     user.experience.add('Software Developer, Acme Corporation');
//     user.education
//         .add('Bachelor of Science in Computer Science, University of XYZ');
//     user.skills.add('Flutter');

//     // Test that the user's information was correctly updated in the User object
//     expect(user.name, equals('Jane Doe'));
//     expect(user.email, equals('janedoe@example.com'));
//     expect(user.phone, equals('555-5678'));
//     expect(user.address, equals('456 Second St'));
//     expect(user.experience, equals(['Software Developer, Acme Corporation']));
//     expect(user.education,
//         equals(['Bachelor of Science in Computer Science, University of XYZ']));
//     expect(user.skills, equals(['Flutter']));
//   });
// }
