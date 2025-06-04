class Crypto {
  final String symbol;
  final String name;
  final DateTime dateAdded;
  final double priceUsd;
  final double priceBrl;

  Crypto({
    required this.symbol,
    required this.name,
    required this.dateAdded,
    required this.priceUsd,
    required this.priceBrl,
  });
}
