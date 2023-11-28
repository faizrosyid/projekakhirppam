import 'package:finpro/Comm/genTextFormField.dart';
import 'package:finpro/Comm/getLoginSignupHeader.dart';
import 'package:finpro/Screens/SignupForm.dart';
import 'package:flutter/material.dart';

import '../DatabaseHandler/DbHelper.dart';
import '../NavigationApp.dart';
import '../pages/home_page.dart';
import 'HomeForm.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    // dbHelper = DbHelper();
    login();
  }

  //void checkDataLogin
  //ngambil list user ex: List<map<string, dynamic>> listUser=await DbHelper.getLoginUser()
  //if(ListUser.isNotEmpty){navigator}

  login() async {
    String uid = _conUserId.text;
    String password = _conPassword.text;

    if (uid.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Input User ID'),
        ),
      );
    } else if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Input Password'),
        ),
      );
    } else {
      await dbHelper.getLoginUser(uid, password).then((user) {
        print("User from database: $user");
        if (user != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => NavigationApp()),
                (Route<dynamic> route) => false,
          );

        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password'),
            ),
          );

        }
      }).catchError((error) {
        print("Database error: $error");
        print("Stack trace: $StackTrace");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Fail'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Login With Signup'),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Login'),
                SizedBox(height: 30),
                getTextFormField(
                  controller: _conUserId,
                  hintName: 'User ID',
                  icon: Icons.person,
                ),
                getTextFormField(
                  controller: _conPassword,
                  hintName: 'Password',
                  icon: Icons.person,
                  isObsecureText: true,
                ),
                SizedBox(height: 30),
                Container(
                  width: 150,
                  height: 30,
                  child: ElevatedButton(
                    child: Text(
                      'Login',
                     // style: TextStyle(color: Colors.white),
                    ),
                    onPressed: login,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Does not have an account?  '),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignupForm()),
                          );
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}