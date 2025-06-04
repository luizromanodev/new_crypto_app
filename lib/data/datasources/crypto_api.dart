import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crypto_model.dart';

class CryptoAPI {
  final String _baseUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest';
  final String _apiKey = 'e1009cce-a973-47ac-963d-c13224359646';

  Future<List<CryptoModel>> getCryptos(List<String> symbols) async {
    // Requisição para USD
    final responseUsd = await http.get(
      Uri.parse("$_baseUrl?symbol=${symbols.join(',')}&convert=USD"),
      headers: {'Accepts': 'application/json', 'X-CMC_PRO_API_KEY': _apiKey},
    );

    // Requisição para BRL
    final responseBrl = await http.get(
      Uri.parse("$_baseUrl?symbol=${symbols.join(',')}&convert=BRL"),
      headers: {'Accepts': 'application/json', 'X-CMC_PRO_API_KEY': _apiKey},
    );

    if (responseUsd.statusCode == 200 && responseBrl.statusCode == 200) {
      final dataUsd =
          json.decode(responseUsd.body)['data'] as Map<String, dynamic>;
      final dataBrl =
          json.decode(responseBrl.body)['data'] as Map<String, dynamic>;

      return symbols.map((symbol) {
        final usdJson = dataUsd[symbol];
        final brlJson = dataBrl[symbol];

        return CryptoModel.fromCombinedJson(usdJson, brlJson);
      }).toList();
    } else {
      throw Exception('Erro ao buscar dados da API');
    }
  }
}
