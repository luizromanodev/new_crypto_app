# CryptoApp

## Sobre o projeto

Aplicativo em flutter que consme a API da Coin Market Cap, listando criptomoedas com base em critérios definidos.

---

## O que ele faz

- Lista as principais criptomoedas com nome, símbolo e preço em USD e BRL.
- Caixa de busca para procurar por moedas usando o símbolo, separado por vírgula (exemplo: `BTC,ETH,SOL`).
- Dá pra atualizar os preços com o botão de refresh ou puxando a lista pra baixo (pull-to-refresh).
- Quando clica numa moeda, aparece um popup com mais detalhes, tipo a data que ela foi adicionada e os preços.

---

## Tecnologias usadas

- Flutter pra criar o app.
- Provider pra gerenciar o estado e facilitar a comunicação entre a UI e a lógica.
- Usei o padrão MVVM pra organizar o código direitinho.
- Consumo da API REST da CoinMarketCap pra pegar os preços.
- Separei o código em camadas: dados (API + modelos), domínio (entidades + repositórios) e apresentação (ViewModels + UI).

---

## Algumas decisões que tomei

- Pra mostrar o preço em USD e BRL ao mesmo tempo, precisei fazer duas requisições separadas na API,
  porque ela não deixa pedir as duas moedas numa só chamada.
- Usei MVVM com ChangeNotifier porque achei mais fácil separar a UI da lógica.
- Tratei erros e loading pra deixar o app mais amigável.
- Usei o pacote intl pra mostrar os valores no formato correto de cada moeda.

---
