
// // Test that the user can navigate from the personal details screen to the experience screen
// import 'package:flutter_test/flutter_test.dart';

// testWidgets('user can navigate from personal details to experience screen', (WidgetTester tester) async {
//   await tester.pumpWidget(MyApp());

//   // Navigate to the personal details screen
//   await tester.tap(find.byKey(Key('personalDetailsButton')));
//   await tester.pumpAndSettle();

//   // Verify that we're on the personal details screen
//   expect(find.byType(PersonalDetailsScreen), findsOneWidget);

//   // Navigate to the experience screen
//   await tester.tap(find.byKey(Key('experienceButton')));
//   await tester.pumpAndSettle();

//   // Verify that we're on the experience screen
//   expect(find.byType(ExperienceScreen), findsOneWidget);
// });

// // Test that the user can enter their personal details
// testWidgets('user can enter personal details', (WidgetTester tester) async {
//   await tester.pumpWidget(MyApp());

//   // Navigate to the personal details screen
//   await tester.tap(find.byKey(Key('personalDetailsButton')));
//   await tester.pumpAndSettle();

//   // Enter the user's name, email, and phone number
//   await tester.enterText(find.byKey(Key('nameTextField')), 'John Doe');
//   await tester.enterText(find.byKey(Key('emailTextField')), 'johndoe@example.com');
//   await tester.enterText(find.byKey(Key('phoneTextField')), '123-456-7890');

//   // Save the personal details
//   await tester.tap(find.byKey(Key('saveButton')));
//   await tester.pumpAndSettle();

//   // Verify that the personal details were saved correctly in the PersonalDetailsBloc
//   final personalDetailsBloc = BlocProvider.of<PersonalDetailsBloc>(tester.element(find.byType(PersonalDetailsScreen)));
//   expect(personalDetailsBloc.state.name, 'John Doe');
//   expect(personalDetailsBloc.state.email, 'johndoe@example.com');
//   expect(personalDetailsBloc.state.phone, '123-456-7890');
// });

// // Test that the app can generate a CV
// testWidgets('app can generate a CV', (WidgetTester tester) async {
//   await tester.pumpWidget(MyApp());

//   // Enter the user's personal details
//   await tester.tap(find.byKey(Key('personalDetailsButton')));
//   await tester.pumpAndSettle();
//   await tester.enterText(find.byKey(Key('nameTextField')), 'John Doe');
//   await tester.enterText(find.byKey(Key('emailTextField')), 'johndoe@example.com');
//   await tester.enterText(find.byKey(Key('phoneTextField')), '123-456-7890');
//   await tester.tap(find.byKey(Key('saveButton')));
//   await tester.pumpAndSettle();

//   // Enter the user's work experience
//   await tester.tap(find.byKey(Key('experienceButton')));
//   await tester.pumpAndSettle();
//   await tester.enterText(find.byKey(Key('companyTextField')), 'Acme Inc.');
//   await tester.enterText(find.byKey(Key('positionTextField')), 'Software Engineer');
//   await tester.enterText(find.byKey(Key('startDateTextField')), '01/01/2020');
//   await tester.enterText(find.byKey(Key('endDateTextField')), '01/01/2022');
//   await tester.enterText(find.byKey(Key('descriptionTextField')), 'Developed and maintained software.');
//   await tester.tap(find.byKey(Key('saveButton')));
//   await tester.pumpAndSettle();

//   // Generate the CV
//   await tester.tap(find.byKey(Key('generateButton')));
//   await tester.pumpAndSettle();

//   // Verify that the generated CV contains the correct information
//   expect(find.text('John Doe'), findsOneWidget);
//   expect(find.text('johndoe@example.com'), findsOneWidget);
//   expect(find.text('123-456-7890'), findsOneWidget);
//   expect(find.text('Acme Inc.'), findsOneWidget);
//   expect(find.text('Software Engineer'), findsOneWidget);
//   expect(find.text('01/01/2020'),findsOneWidget);
//   expect(find.text('01/01/2022'), findsOneWidget);
//   expect(find.text('Developed and maintained software.'), findsOneWidget);
// });