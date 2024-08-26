import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food_app/Firebase/Authentication/email_pass_login.dart';
import 'package:fast_food_app/Firebase/Storage/firestore_firebase.dart';
import 'package:fast_food_app/Screens/home.dart';
import 'package:fast_food_app/Screens/login_screen.dart';
import 'package:fast_food_app/Utility/colors.dart';
import 'package:fast_food_app/Widgets/pass_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/User.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import '../Widgets/footer.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(flex: 3),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                controller: nameController,
                hint: 'Your Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                controller: emailController,
                hint: 'Your Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              PassTextField(
                controller: passController,
                hint: 'Enter Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Coming soon'),
                    ),
                  );
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () async {
                  var hashpass=FirestoreFirebaseAL().hashPassword(passController.text);
                  if (_formKey.currentState!.validate()) {
                    User c=User( name: nameController.text, email: emailController.text,
                        hashedPassword: hashpass, timestamp: DateTime.now());
                    if(await  EmailPassLoginAl().signUpAL(context, emailController.text, hashpass)){
                    bool b= await FirestoreFirebaseAL().uploadUserDataAL(c);
                    if(b){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                    }
                    else{
                      FirestoreFirebaseAL().deleteUserDataAl(emailController.text);
                      EmailPassLoginAl().deleteUser();
                    }
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: primary_color,content: Text("Sign up failed"),));
                    }
                  }
                },
                text: 'Sign Up',
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.deepOrange[600]!,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Footer(),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
