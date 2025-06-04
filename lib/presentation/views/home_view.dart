import 'package:crypto_app/presentation/viewmodels/crypto_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  final _controller = TextEditingController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CryptoViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Criptomoedas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Buscar criptos (ex: BTC,ETH)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    vm.fetchCryptos(_controller.text);
                  },
                ),
              ),
            ),
          ),
          if (vm.loading) CircularProgressIndicator(),
          if (vm.error != null) Text(vm.error!),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => vm.fetchCryptos(_controller.text),
              child: ListView.builder(
                itemCount: vm.cryptos.length,
                itemBuilder: (_, index) {
                  final crypto = vm.cryptos[index];
                  return ListTile(
                    title: Text('${crypto.symbol} - ${crypto.name}'),
                    subtitle: Text(
                      'USD: ${NumberFormat.simpleCurrency(locale: "en_US").format(crypto.priceUsd)} | '
                      'BRL: ${NumberFormat.simpleCurrency(locale: "pt_BR").format(crypto.priceBrl)}',
                    ),
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('${crypto.name} (${crypto.symbol})'),
                        content: Text(
                          'Adicionado em: ${crypto.dateAdded}\n'
                          'Preço USD: ${crypto.priceUsd}\n'
                          'Preço BRL: ${crypto.priceBrl}',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => vm.fetchCryptos(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
