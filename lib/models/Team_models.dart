class TeamModels {
  String id;
  String name;
  String image;
  String description;


  TeamModels({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory TeamModels.fromJson(Map<String, dynamic> json) {
    return TeamModels(
      id: json['idTeam'],
      name: json['strTeam'],
      image: json['strBadge'],
      description: json['strDescriptionEN'],
    );
  }

  
}
