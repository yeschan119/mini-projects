import 'package:banking_app/widgets/button.dart';
import 'package:banking_app/widgets/currency_card.dart';
import 'package:flutter/material.dart';

///runApp은 import material.dart에서 오는 것
///runApp은 widget을 인자로 받는다.
///widget은 레고블록 같은 것. widget을 쌓아서 앱을 완성
///프로그래밍 관점에서 widget을 만든다는 건 class를 생성한다는 것
void main() {
  runApp(const App());
}

//class를 정의한다고 widget이 되는 것은 아니다.
//class를 생성할 때 Flutter SDK에 있는 3개의 core widget중에 하나를 상속 받아야 한다.
///statelessWidget, statefulWidget, ..
class App extends StatelessWidget {
  const App({super.key});

  ///만일 statelessWidget을 상속받으면 한 가지 규칙이 따르는데, 반드시 build method를 생성해야 한다.
  ///flutter에서는 build method가 return하는 것을 화면에 보여줌
  ///build method는 둘 중 하나를 리턴해야 함
  ///material(GOOGLE) & cupertino(APPLE)
  ///물론 원하는 스타일은 customized app이지만 일단 시작점은 뭐로 할지 정해야 함
  ///둘 중 하나를 정한다고 해서 꼭 그 스타일대로만 나오지 않음
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //시작점은 항상 home. home역시 widget임
      ///home의 시작은 보통 scaffold로 함. scaffold는 모든 앱의 구조를 나타냄.
      ///즉, 건물의 뼈대 같은 것이고 이것이 있어야 그 안에 이것저것을 꾸밀 수 있음(body, appbar ..)
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
