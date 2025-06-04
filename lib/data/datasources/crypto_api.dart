import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class CryptoAPI {
  final String _baseUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
  final String _apiKey = 'e1009cce-a973-47ac-963d-c13224359646';

  Future<List<CryptoModel>> getCryptos(List<String> symbols) async {
    final response = await http.get(
      Uri.parse("$_baseUrl?symbol=${symbols.join(',')}&convert=BRL"),
      headers: {'Accepts': 'application/json', 'X-CMC_PRO_API_KEY': _apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as Map<String, dynamic>;
      return data.values.map((item) => CryptoModel.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao buscar dados da API');
    }
  }
}
