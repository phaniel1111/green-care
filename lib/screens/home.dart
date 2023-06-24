import 'package:flutter/material.dart';
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
    );
  }
}
