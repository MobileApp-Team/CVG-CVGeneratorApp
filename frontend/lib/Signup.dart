import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_app4/Login.dart';
import 'package:flutter_project/Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fontend/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _fullNameCon = TextEditingController();
  final _emailCon = TextEditingController();
  final _passwordCon = TextEditingController();
  // final _confirmCon = TextEditingController();
  bool _validator = false;

  void register() async {
    if (_emailCon.text.isNotEmpty &&
        _fullNameCon.text.isNotEmpty &&
        _passwordCon.text.isNotEmpty) {
      var body_req = {
        "name": _fullNameCon.text,
        "email": _emailCon.text,
        "password": _passwordCon.text
      };
      var res = await http.post(Uri.parse('http://10.0.2.2:8000/user/signup'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(body_req));

      var resJson = jsonDecode(res.body);

      if (resJson["status"]) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        showDialog(context: context, builder: (context) => build(context));
      }
    } else {
      setState(() {
        _validator = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var height2 = 40.0;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Positioned(
                child: SvgPicture.asset(
              'images/loginsvg.svg',
              width: 400,
              height: 150,
            )),
            Container(
              // scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    Text(
                      'CV GEN',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Image.asset(
                      'images/signuplogo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'SIGN UP',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _fullNameCon,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          hintText: 'Full name',
                          hintStyle: GoogleFonts.poppins(fontSize: 13),
                          errorText:
                              _validator ? 'Enter required fields' : null,
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _emailCon,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                          ),
                          errorText:
                              _validator ? 'Enter required fields' : null,
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _passwordCon,
                        obscureText: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(fontSize: 13),
                          errorText:
                              _validator ? 'Enter required fields' : null,
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 30),
                    //   child: TextFormField(
                    //     obscureText: true,
                    //     maxLines: 1,
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //       hintText: 'Confirm password',
                    //       hintStyle: GoogleFonts.poppins(fontSize: 13),
                    //       fillColor: Colors.grey[200],
                    //       filled: true,
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //         borderSide: BorderSide(color: Colors.blueGrey),
                    //       ),
                    //       focusedBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //         borderSide: BorderSide(color: Colors.blue),
                    //       ),
                    //       focusedErrorBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //         borderSide: BorderSide(color: Colors.red),
                    //       ),
                    //       errorBorder: const OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //         borderSide: BorderSide(color: Colors.red),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 250,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: FloatingActionButton(
                        backgroundColor: Colors.grey[850],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          register();
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              ' Sign in',
                              style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
