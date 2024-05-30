class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String fullPortrait;
  final String role;
  final List<Ability> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortrait,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
      fullPortrait: json['fullPortrait'] ?? '',
      role: json['role'] != null ? json['role']['displayName'] : '',
      abilities: (json['abilities'] as List)
          .map((ability) => Ability.fromJson(ability))
          .toList(),
    );
  }
}

class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
