import 'dart:convert';
import 'package:http/http.dart' as http;
import 'agent_model.dart';
import 'map_model.dart';

class ApiService {
  final String baseUrl = 'https://valorant-api.com/v1';

  Future<List<Agent>> getAgents() async {
    final response = await http.get(Uri.parse('$baseUrl/agents'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      return data.map((agent) => Agent.fromJson(agent)).toList();
    } else {
      throw Exception('Failed to load agents');
    }
  }

  Future<List<MapData>> getMaps() async {
    final response = await http.get(Uri.parse('$baseUrl/maps'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      return data.map((map) => MapData.fromJson(map)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
