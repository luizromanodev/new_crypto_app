import '../../domain/entities/crypto.dart';

class CryptoModel extends Crypto {
  CryptoModel({
    required super.symbol,
    required super.name,
    required super.dateAdded,
    required super.priceUsd,
    required super.priceBrl,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    final quote = json['quote'];
    return CryptoModel(
      symbol: json['symbol'],
      name: json['name'],
      dateAdded: DateTime.parse(json['date_added']),
      priceUsd: quote['USD']['price'].toDouble(),
      priceBrl: quote['BRL']['price'].toDouble(),
    );
  }
}
