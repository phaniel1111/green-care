import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:greencare/utilities/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isSignIn = false;

  Future<void> _signInWithGoogle(BuildContext context) async {
    setState(() {
      _isSignIn = true;
    });
    try {
      await googleSignIn();
    } catch (error) {

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.authError),
        ),
      );
    }

    setState(() {
      _isSignIn = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: -10,
            child:  Image.asset(
              isDarkMode ? 'assets/images/the_moon.png' : 'assets/images/the_sun.png',
              width: 200,
              height: screenHeight * 0.25,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            height: screenHeight/3,
            width: screenWidth,
            child: FittedBox(
              fit: BoxFit.cover ,
              child: Image.asset(
                isDarkMode ? 'assets/images/night_plant.png' : 'assets/images/day_plant.png',
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Green Care',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color:  isDarkMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                    fontFamily: GoogleFonts.kanit().fontFamily,
                  ),
                ),
                const SizedBox(height: 20,),
                OutlinedButton.icon(
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set desired border radius
                      ),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/logos/google.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  onPressed: !_isSignIn ? (){_signInWithGoogle(context);}: null,
                  label: Text(AppLocalizations.of(context)!.signInGoogle),
                ),
                const SizedBox(height: 20,),
                if(_isSignIn) const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
