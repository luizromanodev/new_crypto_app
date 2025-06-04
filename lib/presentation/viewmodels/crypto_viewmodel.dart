import 'package:flutter/material.dart';
import '../../domain/entities/crypto.dart';
import '../../domain/repositories/crypto_repository.dart';

class CryptoViewModel extends ChangeNotifier {
  final CryptoRepository repository;

  CryptoViewModel(this.repository);

  List<Crypto> cryptos = [];
  bool loading = false;
  String? error;

  final List<String> defaultSymbols = [
    'BTC',
    'ETH',
    'SOL',
    'BNB',
    'BCH',
    'MKR',
    'AAVE',
    'DOT',
    'SUI',
    'ADA',
    'XRP',
    'TIA',
    'NEO',
    'NEAR',
    'PENDLE',
    'RENDER',
    'LINK',
    'TON',
    'XAI',
    'SEI',
    'IMX',
    'ETHFI',
    'UMA',
    'SUPER',
    'FET',
    'USUAL',
    'GALA',
    'PAAL',
    'AERO',
  ];

  Future<void> fetchCryptos([String? query]) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final symbols = query?.isNotEmpty == true
          ? query!.split(',').map((s) => s.trim().toUpperCase()).toList()
          : defaultSymbols;
      cryptos = await repository.fetchCryptos(symbols);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
