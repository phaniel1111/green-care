import 'package:flutter/material.dart';
import 'package:greencare/models/search_item.dart';
import 'package:greencare/widgets/search/search_bar.dart';
import 'package:greencare/widgets/search/search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchItem> _searchResult = [];
  List<SearchItem> searchData = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<SearchItem> search(String input) {
    if (input.isEmpty) {
      return searchData;
    } else {
      String lowerCaseInput = input.toLowerCase();
      return searchData.where((item) {
        return item.category.toLowerCase().contains(lowerCaseInput) ||
            item.name.toLowerCase().contains(lowerCaseInput);
      }).toList();
    }
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await downloadCSVFromFirebaseStorage(); // Download the CSV file
      searchData = await readCSV(); // Read the CSV file and update the searchData list
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error: $error';
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Column(
        children: [
          ItemSearchBar(
            isDarkMode: isDarkMode,
            searchData: searchData,
            searchResult: _searchResult,
            searchFunction: (value) {
              setState(() {
                _searchResult = search(value);
              });
            },
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                  ? Center(child: Text(_errorMessage!))
                  :  SearchList(
                      searchResult: _searchResult,
                      isDarkMode: isDarkMode,
                    ),
          ),
        ],
      ),
    );
  }
}
