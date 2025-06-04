import '../../data/datasources/crypto_api.dart';
import '../entities/crypto.dart';

class CryptoRepository {
  final CryptoAPI api;

  CryptoRepository(this.api);

  Future<List<Crypto>> fetchCryptos(List<String> symbols) {
    return api.getCryptos(symbols);
  }
}
