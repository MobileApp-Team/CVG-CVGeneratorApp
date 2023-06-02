import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/user_model.dart';
import 'package:flutter_project/service/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/page_bloc.dart';
import '../experience/experience_bloc.dart';
import 'personal_detail_bloc.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key? key}) : super(key: key);

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  final PersonalDetailBloc _personalDetailBloc = PersonalDetailBloc();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final professionController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _personalDetailBloc.loadPersonalDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Detail"),
        leading:  BackButton(
          onPressed:() {
            context.read<PageBloc>().add(PreviousPageEvent());
          },
        ),
      ),
      body: BlocProvider<PersonalDetailBloc>(
        create: (context) => _personalDetailBloc,
        child: BlocBuilder<PersonalDetailBloc, Map<String, dynamic>>(
          builder: (context, personalDetail) {
            fullNameController.text = personalDetail['fullName'] ?? '';
            emailController.text = personalDetail['email'] ?? '';
            professionController.text = personalDetail['profession'] ?? '';
            phoneNumberController.text = personalDetail['phoneNumber'] ?? '';
            countryController.text = personalDetail['country'] ?? '';
            cityController.text = personalDetail['city'] ?? '';

            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundImage: const AssetImage(
                      "assets/images/user-profile-icon.jpg",
                    ),
                    child: Stack(
                      children: const [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white70,
                            child: Icon(CupertinoIcons.camera),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Full Name:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: fullNameController,
                    onChanged: (value) {
                      _personalDetailBloc.updateFullName(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "Full Name",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text(
                    "Email Address:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    onChanged: (value) {
                      _personalDetailBloc.updateEmail(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "email@gmail.com",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text(
                    "Profession:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: professionController,
                    onChanged: (value) {
                      _personalDetailBloc.updateProfession(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "Profession",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text(
                    "Phone Number:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: phoneNumberController,
                    onChanged: (value) {
                      _personalDetailBloc.updatePhoneNumber(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "+251 ** *** ****",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text(
                    "Country:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: countryController,
                    onChanged: (value) {
                      _personalDetailBloc.updateCountry(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "Country",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Text(
                    "City:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: cityController,
                    onChanged: (value) {
                      _personalDetailBloc.updateCity(value);
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.black),
                      hintText: "City",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _personalDetailBloc
                              .savePersonalDetail(personalDetail);
                        },
                        child: const Text("Save"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/experience');
                          // context.read<PageBloc>().add(NextPageEvent());
                          GoRouter.of(context).go('./experience');
                        },
                        child: const Text("Next"),
                      ),
                    ],
                  ),
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
    _personalDetailBloc.close();
    fullNameController.dispose();
    emailController.dispose();
    professionController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    cityController.dispose();
    super.dispose();
  }
}
