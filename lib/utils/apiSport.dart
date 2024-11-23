import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_34/models/Team_models.dart';

class ApiService {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<TeamModels>> fetchTeams() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));  

    if (response.statusCode == 200) {
      // Decode the response as a map because it's a JSON object, not a list.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      // Extract the 'data' list from the map.
      List<dynamic> data = jsonResponse['teams'];

      return data.map((fact) => TeamModels.fromJson(fact)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}