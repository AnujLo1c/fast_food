import 'package:fast_food_app/Firebase/Authentication/email_pass_login.dart';
import 'package:fast_food_app/Firebase/Authentication/google_sign_in.dart';
import 'package:fast_food_app/Screens/admin_panel_screen.dart';
import 'package:fast_food_app/Screens/welcome_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utility/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<Profile> {
  static Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          Text("  Profile",
              style: GoogleFonts.playfairDisplay(
                  fontSize: 34,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
          const Gap(10),
          Center(
            child: GestureDetector(
              onTap: () => showComingSoonDialog(context),
              child: ClipOval(
                child: Container(
                  color: primary_color,
                  height: 150,
                  width: 150,
                  child: const Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          const Text("User Name", style: TextStyle(fontSize: 24)),
          const Gap(20),
          Column(
            children: [
              profileTile("Admin Side", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPanelScreen(),));
              }, Icons.admin_panel_settings),
              profileTile("Settings", () {
                showComingSoonDialog(context);
              }, Icons.settings),
              profileTile("Log Out", () {
                EmailPassLoginAl().signOut();
                GoogleSignInAL().signOutGoogle();
                Navigator.of(context).popUntil((route) => route.isFirst);
              }, Icons.logout),
            ],
          ),
        ],
      ),
    );
  }

  Widget profileTile(String text, dynamic onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size!.height / 16,
        width: size?.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: primary_color!),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5),
          ],
        ),
        child: Row(
          children: [
            const Gap(10),
            Icon(icon, color: Colors.black54),
            const Gap(10),
            Text(text, style: const TextStyle(color: Colors.black54)),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.black54),
            const Gap(10)
          ],
        ),
      ),
    );
  }

  void showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Coming Soon"),
        content: const Text("This feature will be available soon!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
