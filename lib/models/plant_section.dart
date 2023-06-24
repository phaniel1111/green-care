enum PlantSection {
  vegetables,
  fruits,
  flowers,
  herbs,
  ornamentalPlants,
}

Map<PlantSection, String> plantSectionName = {
  PlantSection.vegetables: 'Vegetables',
  PlantSection.fruits: 'Fruits',
  PlantSection.flowers: 'Flowers',
  PlantSection.herbs: 'Herbs',
  PlantSection.ornamentalPlants: 'Ornamental Plants',
};

class PlantSectionData {
  final String section;
  final String imagePath;

  PlantSectionData({
    required this.section,
    required this.imagePath,
  });
}

List<PlantSectionData> plantSections = [
  PlantSectionData(
    section: plantSectionName[PlantSection.vegetables]!,
    imagePath: 'https://i.pinimg.com/564x/d8/bb/ab/d8bbabc7a7991522601c7af50a1696df.jpg',
  ),
  PlantSectionData(
    section: plantSectionName[PlantSection.fruits]!,
    imagePath: 'https://i.pinimg.com/564x/d8/bb/ab/d8bbabc7a7991522601c7af50a1696df.jpg',
  ),
  PlantSectionData(
    section: plantSectionName[PlantSection.flowers]!,
    imagePath: 'https://i.pinimg.com/564x/d8/bb/ab/d8bbabc7a7991522601c7af50a1696df.jpg',
  ),
  PlantSectionData(
    section: plantSectionName[PlantSection.herbs]!,
    imagePath: 'https://i.pinimg.com/564x/d8/bb/ab/d8bbabc7a7991522601c7af50a1696df.jpg',
  ),
  PlantSectionData(
    section: plantSectionName[PlantSection.ornamentalPlants]!,
    imagePath: 'https://i.pinimg.com/564x/d8/bb/ab/d8bbabc7a7991522601c7af50a1696df.jpg',
  ),
];