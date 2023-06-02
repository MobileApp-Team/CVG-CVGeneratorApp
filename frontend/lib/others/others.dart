import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/database_helper.dart';
import '../service/database_helper.dart';
import 'others_bloc.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  final OthersBloc _othersBloc = OthersBloc();

  final skillController = TextEditingController();
  final educationController = TextEditingController();
  final additionalInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _othersBloc.loadOthers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _othersBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Others"),
          leading: const BackButton(),
        ),
        body: BlocProvider<OthersBloc>(
          create: (context) => _othersBloc,
          child: BlocBuilder<OthersBloc, Map<String, dynamic>>(
            builder: (context, personalDetail) {
              skillController.text = personalDetail['skill'] ?? '';
              educationController.text = personalDetail['education'] ?? '';
              additionalInfoController.text = personalDetail['additionalInfo'] ?? '';

              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Skills:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextField(
                      controller: skillController,
                      decoration: InputDecoration(
                        // labelText: 'Enter Message',
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "Skill",
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    // Existing code
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // _othersBloc.add(AddSkillEvent(skillController.text));
                        },
                        child: const Text("Add Skill"),
                      ),
                    ),

                    const Text(
                      "Education :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: educationController,
                      decoration: InputDecoration(
                        // labelText: 'Enter Message',
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "Education",
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5, // <-- SEE HERE
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // _othersBloc.add(
                          //     AddEducationEvent(_educationController.text));
                        },
                        child: const Text("Add Education"),
                      ),
                    ),
                    const Text(
                      "Additional Information :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: additionalInfoController,
                      decoration: InputDecoration(
                        // labelText: 'Enter Message',
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "Skill",
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5, // <-- SEE HERE
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _othersBloc.saveOthers(Others as Map<String, dynamic>);
                        },
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _othersBloc.close();
    skillController.dispose();
    educationController.dispose();
    additionalInfoController.dispose();
    super.dispose();
  }
}
