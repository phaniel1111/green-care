import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greencare/models/plant_details.dart';
import 'package:greencare/models/plant_section.dart';
import 'package:greencare/models/search_item.dart';
import 'package:greencare/utilities/device/error_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PlantDetailScreen extends StatefulWidget {
  final SearchItem plant;

  const PlantDetailScreen({super.key, required this.plant});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  late Future<Plant> _plantFuture;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _plantFuture = getPlantFromFirestore(widget.plant.id)
        .whenComplete(() => setState(() {
      _isLoading = false;
    }));
  }

  Future<Plant> getPlantFromFirestore(String docId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('plants').doc(docId).get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      PlantSection section = plantSectionFromString(data['section']);

      Plant plant = Plant(
        name: data['name'],
        section: section,
        space: Map<String, dynamic>.from(data['space']),
        environment: Map<String, dynamic>.from(data['environment']),
        action: Map<String, int>.from(data['action']),
        harvestTime: List<int>.from(data['harvestTime']),
        whenToPlant: List<int>.from(data['whenToPlant']),
        imageUrl: List<String>.from(data['imageUrl']),
      );

      return plant;
    } else {
      throw Exception(AppLocalizations.of(context)!.plantError);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    String myLocale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plant.name),
      ),
      body: FutureBuilder<Plant>(
        future: _plantFuture,
        builder: (BuildContext context, AsyncSnapshot<Plant> snapshot) {
          if (_isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return ErrorDetail(
              errorMessage: snapshot.error.toString(),
              isDarkMode: isDarkMode,
            );
          } else if (snapshot.hasData) {
            Plant plant = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${plant.name}'),
                  Text('Section: ${getPlantSectionName(myLocale,plant.section)}'),
                  Text('Space: ${plant.space.toString()}'),
                  Text('Environment: ${plant.environment.toString()}'),
                  Text('Action: ${plant.action.toString()}'),
                  Text('Harvest Time: ${plant.harvestTime.toString()}'),
                  Text('When to Plant: ${plant.whenToPlant.toString()}'),
                  Text('Image URLs: ${plant.imageUrl.toString()}'),
                  // Add more details here as needed
                ],
              ),
            );

          } else {
            return Center(
              child: Text(AppLocalizations.of(context)!.plantError),
            );
          }
        },
      ),
    );
  }
}