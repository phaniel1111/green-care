import 'package:greencare/models/plant_section.dart';

class Plant {
  String name;
  PlantSection section;
  Map<String, dynamic> space;
  Map<String, dynamic> environment;
  Map<String, int> action;
  List<int> harvestTime;
  List<int> whenToPlant;
  List<String> imageUrl;

  Plant({
    required this.name,
    required this.section,
    required this.space,
    required this.environment,
    required this.action,
    required this.harvestTime,
    required this.whenToPlant,
    required this.imageUrl,
  });

}