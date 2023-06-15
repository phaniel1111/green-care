import 'package:flutter/material.dart';
import 'package:greencare/utilities/device/dark_light_setting.dart' as theme_config;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var selectedSection = true;


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSection = true;
                  });
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedSection ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSecondary,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Today',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:  selectedSection ? theme_config.getTextColor(!isDarkMode) : theme_config.getTextColor(isDarkMode),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSection = false;
                  });
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: !selectedSection ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSecondary,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Next days',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:  !selectedSection ? theme_config.getTextColor(!isDarkMode) : theme_config.getTextColor(isDarkMode),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          const SizedBox(height: 16),
          if (selectedSection)
            Text(
              'Today Section',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: theme_config.getTextColor(isDarkMode),
              ),
            ),
          if (!selectedSection)
            Text(
              'Upcoming Section',
               style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 color: theme_config.getTextColor(isDarkMode),
               ),
            ),
        ],
      ),
    );
  }
}
