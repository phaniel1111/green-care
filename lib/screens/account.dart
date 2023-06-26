import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greencare/models/search_item.dart';
import 'package:transparent_image/transparent_image.dart';

final _userDetails = FirebaseAuth.instance.currentUser;

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String message = "Success";

  Future<void> _function1(BuildContext context) async {
    try {
      await downloadCSVFromFirebaseStorage(isManual: true);
    } catch (error) {
      message = "Failed";
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
      body: Column(
        children: [
          UserDetails(),
          CustomTapWidget(
            onTap: () {
              _function1(context);
            },
            text: 'Get the newest plants data',
            icon: Icons.download,
          ),
          CustomTapWidget(
            onTap: () {
                FirebaseAuth.instance.signOut();
                GoogleSignIn().disconnect();
                Navigator.pop(context);
            },
            text: 'Logout',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

class CustomTapWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  const CustomTapWidget({
    required this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            color: Colors.transparent,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      icon,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      color: isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          Center(
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: _userDetails!.photoURL!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              _userDetails!.displayName!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              _userDetails!.email!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

