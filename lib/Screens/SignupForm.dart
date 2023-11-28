import 'package:finpro/Comm/getLoginSignupHeader.dart';
import 'package:finpro/Models/UserModel.dart';
import 'package:finpro/Screens/LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../Comm/genTextFormField.dart';
import '../DatabaseHandler/DbHelper.dart';
import 'package:finpro/DatabaseHandler/DbHelper.dart';
import 'package:path_provider/path_provider.dart';
class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  final _conEmail = TextEditingController();
  var dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String password = _conPassword.text;
    String cpassword = _conCPassword.text;

    if (_formKey.currentState!.validate()) {
      if (password != cpassword) {
        showSnackBar('Password Mismatch');
      } else {
        _formKey.currentState!.save();
        UserModel user = UserModel(uid, uname, email, password);
        await dbHelper.saveData(user).then((userData) {
          showSnackBar('Saved');
        }).catchError((error) {
          print(error);
          showSnackBar('Failed to save data');
        });
      }
    } else {
      showSnackBar('Please fill in all required fields');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Form"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.only(top: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Sign Up'),
                getTextFormField(
                  controller: _conUserId,
                  hintName: 'User ID',
                  icon: Icons.person,
                ),
                getTextFormField(
                  controller: _conUserName,
                  hintName: 'User Name',
                  inputType: TextInputType.name,
                  icon: Icons.person_outline,
                ),
                getTextFormField(
                  controller: _conEmail,
                  hintName: 'E-mail',
                  inputType: TextInputType.emailAddress,
                  icon: Icons.email,
                ),
                getTextFormField(
                  isObsecureText: true,
                  controller: _conPassword,
                  hintName: 'Password',
                  icon: Icons.lock,
                ),
                getTextFormField(
                  isObsecureText: true,
                  controller: _conCPassword,
                  hintName: 'Confirm Password',
                  icon: Icons.lock,
                ),
                SizedBox(height: 30),
                Container(
                  width: 150,
                  height: 30,
                  child: ElevatedButton(
                    child: Text(
                      'Create Account',
                    ),
                    onPressed: signUp,
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
                      Text('Have an account?  '),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Text('Log In'),
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