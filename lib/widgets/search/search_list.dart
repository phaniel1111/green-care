import 'package:flutter/material.dart';
import 'package:greencare/models/search_item.dart';

class SearchList extends StatelessWidget {
  final List<SearchItem> searchResult;
  final bool isDarkMode;

  const SearchList({
    required this.searchResult,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
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
              '${item.category[0].toUpperCase()}${item.category.substring(1)}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(plant: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final SearchItem plant;

  const DetailScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(plant.category),
            // Display additional details about the plant
          ],
        ),
      ),
    );
  }
}