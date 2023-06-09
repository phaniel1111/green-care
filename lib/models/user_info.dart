class UserInformation {
  String uid;
  String name;
  String email;
  String imageURL;
  bool isPremium;

  UserInformation({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageURL,
    required this.isPremium,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      imageURL: json['imageURL'],
      isPremium: json['isPremium'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'imageURL': imageURL,
      'isPremium': isPremium,
    };
  }
}
