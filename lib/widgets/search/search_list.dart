import 'package:flutter/material.dart';
import 'package:greencare/models/search_item.dart';
import 'package:greencare/models/plant_section.dart';
import 'package:greencare/screens/plant_details.dart';

class SearchList extends StatelessWidget {
  final List<SearchItem> searchResult;
  final bool isDarkMode;

  const SearchList({
    super.key,
    required this.searchResult,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    String myLocale = Localizations.localeOf(context).toString();

    return ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        final item = searchResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adjust the horizontal padding as needed
          child: ListTile(
            title: Text(
              '${item.name[0].toUpperCase()}${item.name.substring(1)}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              getPlantSectionName(myLocale,plantSectionFromString(item.category)),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetailScreen(plant: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

