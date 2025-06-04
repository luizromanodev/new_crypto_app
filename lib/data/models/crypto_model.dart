class CryptoModel {
  final String name;
  final String symbol;
  final double priceUsd;
  final double priceBrl;
  final DateTime dateAdded;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.priceBrl,
    required this.dateAdded,
  });

  factory CryptoModel.fromCombinedJson(
    Map<String, dynamic> usdJson,
    Map<String, dynamic> brlJson,
  ) {
    return CryptoModel(
      name: usdJson['name'] ?? '',
      symbol: usdJson['symbol'] ?? '',
      priceUsd: (usdJson['quote']?['USD']?['price'] ?? 0).toDouble(),
      priceBrl: (brlJson['quote']?['BRL']?['price'] ?? 0).toDouble(),
      dateAdded:
          DateTime.tryParse(usdJson['date_added'] ?? '') ?? DateTime.now(),
    );
  }
}
