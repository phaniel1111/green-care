import 'package:greencare/models/plant_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  String name;
  PlantSection section;
  Map<String, dynamic> space;
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

  factory Plant.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    print('Parsing data for plant ${data['name']}');
    print('Section: ${data['section']}');
    print('Image URL: ${data['imageUrl']}');
    return Plant(
      name: data['name'],
      section: PlantSection.values.firstWhere(
            (e) => e.toString() == 'PlantSection.${data['section']}',
      ),
      space: Map<String, dynamic>.from(data['space']),
      environment: Map<String, dynamic>.from(data['environment']),
      action: Map<String, int>.from(data['action']),
      harvestTime: List<int>.from(data['harvestTime']),
      problems: List<String>.from(data['problems']),
      pests: List<String>.from(data['pests']),
      toxic: List<String>.from(data['toxic']),
      imageUrl: List<String>.from(data['imageUrl']),
      createdDate: DateTime.parse(data['createdDate']),
    );
  }

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