import 'package:flutter/material.dart';
import 'package:flutter_project/experience/experience_bloc.dart';
import 'package:flutter_project/personal_detail/personal_detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../profile/profile2.dart';

class ExperiencePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const ExperiencePage({Key? key, required this.navigatorKey})
      : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final ExperienceBloc _experienceBloc = ExperienceBloc();

  final jobTitleController = TextEditingController();
  final organizationNameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Experience"),
        leading: BackButton(
          // onPressed: () {context.go('/profile');},
          onPressed: () {
            // Navigator.pushNamed(context, '/experience');
            context.read<ExperienceBloc>().add(SavePersonalDetailEvent() as ExperienceEvent);
            GoRouter.of(context).go('./');
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Title/Position:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: jobTitleController, // Add controller
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                hintText: "Job title",
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const Text(
              "Organization/Company Name :",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: organizationNameController, // Add controller
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                hintText: "Organization/Company Name",
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const Text(
              "Description :",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: descriptionController, // Add controller
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black),
                hintText: "Description",
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white70,
                child: Icon(
                  Icons.add_circle_rounded,
                  size: 40,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _experienceBloc.close();
    jobTitleController.dispose();
    organizationNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
