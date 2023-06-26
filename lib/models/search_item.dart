import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class SearchItem {
  final String id;
  final String category;
  final String name;
  SearchItem(this.id, this.category, this.name);

}

Future<void> downloadCSVFromFirebaseStorage({bool isManual = false}) async {


  const String csvFileName = 'plants.csv'; // Name of the CSV file in Firebase Storage

  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String localFilePath = '${appDirectory.path}/plants.csv'; // Path where the CSV file will be saved locally

  final File localFile = File(localFilePath);

  if(isManual){
    final ref = FirebaseStorage.instance.ref(csvFileName);
    await ref.writeToFile(localFile);
  }else{
    // Check if the file already exists and the last modification time
    final FileStat fileStat = await localFile.stat();
    final DateTime now = DateTime.now();
    const Duration oneDay = Duration(days: 1);
    final bool shouldDownload =
        !localFile.existsSync() || now.difference(fileStat.modified) >= oneDay;

    if (shouldDownload) {
      final ref = FirebaseStorage.instance.ref(csvFileName);
      await ref.writeToFile(localFile);
    }
  }
}

Future<List<SearchItem>> readCSV() async {
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String localFilePath = '${appDirectory.path}/plants.csv'; // Path to the local CSV file

  final File csvFile = File(localFilePath);
  if (!csvFile.existsSync()) {
    throw Exception('CSV file does not exist');
  }

  final List<SearchItem> searchItems = [];
  final List<String> lines = await csvFile.readAsLines();

  for (String line in lines) {
    searchItems.add(csvLineToSearchItem(line));
  }
  return searchItems;
}

SearchItem csvLineToSearchItem(String line) {
  final List<dynamic> fields = line.split(',');

  if (fields.length != 3) {
    throw Exception('Invalid CSV line: $line');
  }

  return SearchItem(fields[0], fields[1], fields[2]);
}