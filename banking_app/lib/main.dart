import 'package:banking_app/widgets/button.dart';
import 'package:banking_app/widgets/currency_card.dart';
import 'package:flutter/material.dart';

///runApp은 import material.dart에서 오는 것
///runApp은 widget을 인자로 받는다.
///widget은 레고블록 같은 것. widget을 쌓아서 앱을 완성
///프로그래밍 관점에서 widget을 만든다는 건 class를 생성한다는 것
///class를 생성할 때 보통 new를 붙이지만 dart은 new 생랼 가능
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
  ///둘 중 하나를 정한다고 해서 꼭 그 스타일 대로만 나오지 않음
  ///
  ///setting.json에 “dart.previewFlutterUiGuides” : true 설정하면 guide line이 나옴
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //시작점은 항상 home. home역시 widget임
      ///home의 시작은 보통 scaffold로 함. scaffold는 모든 앱의 구조를 나타냄.
      ///즉, 건물의 뼈대 같은 것이고 이것이 있어야 그 안에 이것저것을 꾸밀 수 있음(body, appbar ..)
      home: Scaffold(
        ///Colors.red.shade100와 같은 방법으로 쓸 수도 있음. 색깔을 먼저 찾고 밝기 설정
        backgroundColor: const Color(0xFF181818),

        ///내용이 화면 사이즈를 넘어설 때 스크롤로 내려 볼 수 있도록 하는 위젯
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///sizedBox는 말 그대로 일정한 사이즈의 빈 박스입. 이걸 사이에 넣어서 공간을 만들어줌
                const SizedBox(
                  height: 80,
                ),
                Row(
                  ///mainAxisAlignment는 수평방향에서 위치를 정할 때 사용
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      ///crossAxisAlignment는 수직방향에서 위치를 정할 때 사용(row)
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
                  cardOffset: Offset(0, 0),
                ),

                ///widget들을 겹치에 하기 위해 부모와 상관 없이 움직이도록 해야 하므로 transform 사용
                const CurrencyCard(
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
                  cardOffset: Offset(0, -10),
                ),
                const CurrencyCard(
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
                  cardOffset: Offset(0, -10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
