import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/database_helper.dart';
import 'project_bloc.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final ProjectBloc _projectBloc = ProjectBloc();
  final projectTitleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _projectBloc.loadProject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
        leading: const BackButton(),
      ),
      body: BlocProvider<ProjectBloc>(
        create: (context) => _projectBloc,
        child: BlocBuilder<ProjectBloc, Map<String, dynamic>>(
          builder: (context, personalDetail) {
            // final projectTitleController = TextEditingController();
            // final descriptionController = TextEditingController();
            projectTitleController.text = personalDetail['projectTitle'] ?? '';
            descriptionController.text = personalDetail['description'] ?? '';
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Project Title:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: projectTitleController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "Project title",
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
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "Description",
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5, // <-- SEE HERE
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
                    onPressed: () {
                      _projectBloc.saveProject(personalDetail);
                    },
                    child: const Text("save"),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _projectBloc.close();
    projectTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
