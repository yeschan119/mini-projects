import 'package:banking_app/widgets/button.dart';
import 'package:banking_app/widgets/currency_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, EungChan',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$5 192 482',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      bgColor: Colors.amber,
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  currency: 'Euro',
                  currencyColor: Colors.white,
                  rate: '6 428',
                  rateColor: Colors.white,
                  currencyUnit: 'EUR',
                  currencyUnitColor: Colors.white,
                  backgroundColor: Color(0xFF1F2123),
                  icons: Icon(
                    Icons.euro_rounded,
                    color: Colors.white,
                    size: 85,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: const CurrencyCard(
                    currency: 'Bitcoin',
                    currencyColor: Colors.black,
                    rate: '9 785',
                    rateColor: Colors.black,
                    currencyUnit: 'BTC',
                    currencyUnitColor: Colors.black,
                    backgroundColor: Colors.white,
                    icons: Icon(
                      Icons.currency_bitcoin_rounded,
                      color: Colors.black,
                      size: 85,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: const CurrencyCard(
                    currency: 'Dollar',
                    currencyColor: Colors.white,
                    rate: '428',
                    rateColor: Colors.white,
                    currencyUnit: 'USD',
                    currencyUnitColor: Colors.white,
                    backgroundColor: Color(0xFF1F2123),
                    icons: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.white,
                      size: 85,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
