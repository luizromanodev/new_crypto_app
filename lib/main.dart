import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/crypto_api.dart';
import 'domain/repositories/crypto_repository.dart';
import 'presentation/viewmodels/crypto_viewmodel.dart';
import 'presentation/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CryptoViewModel(CryptoRepository(CryptoAPI())),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
