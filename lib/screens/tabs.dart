import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:greencare/app_icons.dart';
import 'package:greencare/screens/home.dart';


class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;

  void _selectPage(int i){
    setState(() {
      _selectedPageIndex = i;
    });
  }

  void _showInfoMessage(String t){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t)));
  }

  @override
  Widget build(BuildContext context) {


    Widget activePage = const HomeScreen();
    var activePageTitle = 'Home';

    switch (_selectedPageIndex) {
      case 0:
        activePage = const HomeScreen();
        activePageTitle = AppLocalizations.of(context)!.home;
        break;
      case 1:
        activePage = const HomeScreen();
        activePageTitle = AppLocalizations.of(context)!.garden;
        break;
      case 2:
        activePage = const HomeScreen();
        activePageTitle = AppLocalizations.of(context)!.plants;
        break;
      case 3:
        activePage = const HomeScreen();
        activePageTitle = AppLocalizations.of(context)!.shop;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        /*title: Text(
          activePageTitle,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color:  Theme.of(context).colorScheme.primary,
          ),
        ),*/
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            GoogleSignIn().disconnect();
          }, icon: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).colorScheme.primary,
          ),
          ),
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(icon: const Icon(AppIcons.garden,),label: activePageTitle),
          BottomNavigationBarItem(icon: const Icon(AppIcons.flowers), label: activePageTitle),
          BottomNavigationBarItem(icon: const Icon(Icons.search,), label: activePageTitle),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_basket_rounded,), label: activePageTitle),
        ],
      ),
    );
  }
}

