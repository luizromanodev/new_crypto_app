import '../../data/datasources/crypto_api.dart';
import '../entities/crypto.dart';

class CryptoRepository {
  final CryptoAPI api;

  CryptoRepository(this.api);

  Future<List<Crypto>> fetchCryptos(List<String> symbols) async {
    final models = await api.getCryptos(symbols);
    return models
        .map(
          (model) => Crypto(
            name: model.name,
            symbol: model.symbol,
            priceUsd: model.priceUsd,
            priceBrl: model.priceBrl,
            dateAdded: model.dateAdded,
          ),
        )
        .toList();
  }
}
