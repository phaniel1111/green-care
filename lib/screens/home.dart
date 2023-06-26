import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:greencare/screens/search.dart';
import 'package:greencare/widgets/home/task_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var selectedSection = true;

  void onSelectedSection(bool b) {
    setState(() {
      selectedSection = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          TaskSelector(isDarkMode: isDarkMode, onSelectedSection: onSelectedSection),
          const SizedBox(height: 16),
          if (selectedSection)
            Text(
              'Today Section',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          if (!selectedSection)
            Text(
              'Upcoming Section',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 color: isDarkMode ? Colors.white : Colors.black,
               ),
            ),
        ],
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 700),
        transitionType: ContainerTransitionType.fadeThrough,
        closedElevation: 0,
        openElevation: 0,
        closedColor: Theme.of(context).canvasColor,
        openColor: Theme.of(context).canvasColor,
        closedBuilder: (context, action) {
          return FloatingActionButton(
            onPressed: action,
            child: const Icon(Icons.add),
          );
        },
        openBuilder: (context, action) {
          return const AppBarSearchList();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class AppBarSearchList extends StatelessWidget {
  const AppBarSearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 40),
        Expanded(
          child: SafeArea(
            child: SearchScreen(),
          ),
        ),
      ],
    );
  }
}
