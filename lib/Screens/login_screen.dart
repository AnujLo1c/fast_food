import 'package:fast_food_app/Firebase/Authentication/email_pass_login.dart';
import 'package:fast_food_app/Firebase/Storage/firestore_firebase.dart';
import 'package:fast_food_app/Screens/home.dart';
import 'package:fast_food_app/Screens/sign_up_screen.dart';
import 'package:fast_food_app/Utility/colors.dart';
import 'package:fast_food_app/Widgets/custom_text_field.dart';
import 'package:fast_food_app/Widgets/pass_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/footer.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Email',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              controller: emailController,
              hint: 'Your Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            PassTextField(
              controller: passController,
              hint: 'Enter Password',
            ),
            const SizedBox(
              height: 5,
            ),
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
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onPressed: () async {
                  bool b = await EmailPassLoginAl().loginInAL(
                      context, emailController.text, FirestoreFirebaseAL().hashPassword(passController.text));
                  if (b) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Login failed"),
                      backgroundColor: primary_color,
                    ));
                  }
                },
                text: 'Sign Up'),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            color: Colors.deepOrange[600]!,
                            decoration: TextDecoration.underline,
                            fontSize: 16))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Footer(),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
