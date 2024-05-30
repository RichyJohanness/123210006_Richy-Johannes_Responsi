// map_model.dart
class MapData {
  final String uuid;
  final String displayName;
  final String displayIcon;
  final String splash;
  final String tacticalDescription;

  MapData({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.splash,
    required this.tacticalDescription,
  });

  factory MapData.fromJson(Map<String, dynamic> json) {
    return MapData(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      splash: json['splash'] ?? '',
      tacticalDescription: json['tacticalDescription'] ?? '',
    );
  }

}
