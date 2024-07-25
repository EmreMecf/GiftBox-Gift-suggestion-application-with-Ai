import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  final String apiKey;

  GeminiAPI({required this.apiKey});

  Future<List<String>> getRecommendations(String category) async {
    final url = Uri.parse('https://generativelanguage.googleapis.com/rest?version=v1beta/apikey=$apiKey');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': {
            'text': category,
          },
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final recommendations = (jsonResponse['recommendations'] as List<dynamic>)
            .map((item) => item['text'] as String)
            .toList();
        return recommendations;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
