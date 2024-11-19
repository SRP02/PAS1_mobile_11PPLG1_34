class FavoriteteamModels {
  String id;
  String name;
  String image;
  String description;


  FavoriteteamModels({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTeam': id,
      'strTeam': name,
      'strBadge': image,
      'strDescriptionEN': description,
    };
  }

  factory FavoriteteamModels.fromMap(Map<String, dynamic> map) {
    return FavoriteteamModels(
      id: map['idTeam'],
      name: map['strTeam'],
      image: map['strBadge'],
      description: map['strDescriptionEN'],
    );
  }
}
