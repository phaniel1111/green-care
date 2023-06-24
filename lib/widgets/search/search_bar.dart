import 'package:flutter/material.dart';
import 'package:greencare/models/search_item.dart';

class ItemSearchBar extends StatefulWidget {
  final List<SearchItem> searchData;
  final List<SearchItem> searchResult;
  final Function(String) searchFunction;
  final bool isDarkMode;

  const ItemSearchBar({
    Key? key,
    required this.searchData,
    required this.searchResult,
    required this.searchFunction,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<ItemSearchBar> createState() => _ItemSearchBarState();
}

class _ItemSearchBarState extends State<ItemSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _showClearIcon
                    ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _showClearIcon = false;
                    });
                    widget.searchFunction('');
                  },
                )
                    : null,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
              onChanged: (value) {
                setState(() {
                  _showClearIcon = value.isNotEmpty;
                });
                widget.searchFunction(value);
              },
              //onSubmitted: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
