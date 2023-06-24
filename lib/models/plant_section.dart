enum PlantSection {
  vegetables,
  fruits,
  flowers,
  herbs,
  ornamentalPlants,
}

Map<String, Map<PlantSection, String>?> kit = {
  'vi': {
    PlantSection.vegetables: 'Rau củ',
    PlantSection.fruits: 'Trái cây',
    PlantSection.flowers: 'Hoa',
    PlantSection.herbs: 'Thảo mộc',
    PlantSection.ornamentalPlants: 'Cây cảnh',
  },
  'en': {
    PlantSection.vegetables: 'Vegetables',
    PlantSection.fruits: 'Fruits',
    PlantSection.flowers: 'Flowers',
    PlantSection.herbs: 'Herbs',
    PlantSection.ornamentalPlants: 'Ornamental Plants',
  },
};

String getPlantSectionName(String languageCode, PlantSection section) {
  if (kit.containsKey(languageCode)) {
    Map<PlantSection, String>? languageKit = kit[languageCode];
    if (languageKit != null && languageKit.containsKey(section)) {
      return languageKit[section]!;
    }
  }
  return kit['en']![section]!; // Return English translation as default
}


PlantSection plantSectionFromString(String section) {
  switch (section) {
    case 'vegetables':
      return PlantSection.vegetables;
    case 'fruits':
      return PlantSection.fruits;
    case 'flowers':
      return PlantSection.flowers;
    case 'herbs':
      return PlantSection.herbs;
    case 'ornamentalPlants':
      return PlantSection.ornamentalPlants;
    default:
      throw Exception('Invalid plant section');
  }
}
