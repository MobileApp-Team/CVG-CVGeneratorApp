import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/profile/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fontend/Home.dart';
// import 'package:fontend/getField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late SharedPreferences preffs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPreff();
  }

  void initSharedPreff() async {
    preffs = await SharedPreferences.getInstance();
  }

  bool validator = false;

  void loginUser() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var body_req = {
        "email": _emailController.text,
        "password": _passwordController.text
      };
      var res = await http.post(Uri.parse('http://10.0.2.2:8000/user/login'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(body_req));

      var resJson = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var authToken = resJson['token'];
        preffs.setString('token', authToken);
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfilePage(token: authToken)));
      } else if (res.statusCode == 403) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account not registered')));
      } else if (res.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Incorrect password!')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Blank value found')));
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
                      'images/loginlogo1.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'SIGN IN',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // GetField(
                    //     icon: Icons.email_sharp,
                    //     controller: _emailController,
                    //     hintName: 'Enter your email',
                    //     obscured: false),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _emailController,
                        obscureText: false,
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_sharp,
                            size: 20,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.poppins(fontSize: 13),
                          errorText: validator ? 'Enter required fields' : null,
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black),
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

                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 20,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(fontSize: 13),
                          errorText: validator ? 'Enter required fields' : null,
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black),
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
                    Container(
                      width: 250,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: FloatingActionButton(
                        backgroundColor: Colors.grey[850],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          loginUser();
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: Text(
                              ' Sign up',
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
