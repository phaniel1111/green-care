import 'package:greencare/models/plant_section.dart';

class Plant {
  String name;
  PlantSection section;
  Map<String, List<double>> space;
  Map<String, dynamic> environment;
  Map<String, int> action;
  List<int> harvestTime;
  List<String> problems;
  List<String> pests;
  List<String> toxic;
  List<String> imageUrl;
  DateTime createdDate;

  Plant({
    required this.name,
    required this.section,
    required this.space,
    required this.environment,
    required this.action,
    required this.harvestTime,
    required this.problems,
    required this.pests,
    required this.toxic,
    required this.imageUrl,
    required this.createdDate,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'],
      section: PlantSection.values.firstWhere(
            (e) => e.toString().split('.').last == json['section'],
      ),
      space: Map<String, List<double>>.from(json['space']),
      environment: Map<String, dynamic>.from(json['environment']),
      action: Map<String, int>.from(json['action']),
      harvestTime: List<int>.from(json['harvestTime']),
      problems: List<String>.from(json['problems']),
      pests: List<String>.from(json['pests']),
      toxic: List<String>.from(json['toxic']),
      imageUrl: List<String>.from(json['imageUrl']),
      createdDate: DateTime.parse(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'section': section.toString().split('.').last,
      'space': space,
      'environment': environment,
      'action': action,
      'harvestTime': harvestTime,
      'problems': problems,
      'pests': pests,
      'toxic': toxic,
      'imageUrl': imageUrl,
      'createdDate': createdDate.toIso8601String(),
    };
  }
}