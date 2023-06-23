import 'package:flutter/material.dart';
import 'package:greencare/utilities/device/dark_light_setting.dart' as theme_config;


class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.isDarkMode, required this.onSelectedSection});
  final void Function(bool b) onSelectedSection;
  final bool isDarkMode;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  var selectedSection = true;

  void updateSelectedSection(bool newSelectedSection) {
    setState(() {
      selectedSection = newSelectedSection;
      widget.onSelectedSection(newSelectedSection);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            updateSelectedSection(true);
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
                color:  selectedSection ? theme_config.getTextColor(!widget.isDarkMode) : theme_config.getTextColor(widget.isDarkMode),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            updateSelectedSection(false);
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
                color:  !selectedSection ? theme_config.getTextColor(!widget.isDarkMode) : theme_config.getTextColor(widget.isDarkMode),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
