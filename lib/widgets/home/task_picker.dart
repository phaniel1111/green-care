import 'package:flutter/material.dart';


class TaskSelector extends StatefulWidget {
  const TaskSelector({super.key, required this.isDarkMode, required this.onSelectedSection});
  final void Function(bool b) onSelectedSection;
  final bool isDarkMode;

  @override
  State<TaskSelector> createState() => _TaskSelectorState();
}

class _TaskSelectorState extends State<TaskSelector> {
  var selectedSection = true;

  void updateSelectedSection(bool b) {
    setState(() {
      selectedSection = b;
      widget.onSelectedSection(b);
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
              color: selectedSection ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color:  (widget.isDarkMode ^ selectedSection) ? Colors.white : Colors.black,
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
              color: !selectedSection ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              'Upcoming',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: (widget.isDarkMode ^ !selectedSection) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
