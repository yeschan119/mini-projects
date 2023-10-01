import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currency;
  final Color currencyColor;
  final String rate;
  final Color rateColor;
  final String currencyUnit;
  final Color currencyUnitColor;
  final Color backgroundColor;
  final Icon icons;
  final Offset cardOffset;

  const CurrencyCard({
    super.key,
    required this.currency,
    required this.currencyColor,
    required this.rate,
    required this.rateColor,
    required this.currencyUnit,
    required this.currencyUnitColor,
    required this.backgroundColor,
    required this.icons,
    required this.cardOffset,
  });

  @override
  Widget build(BuildContext context) {
    ///box같은 거 만들기 전에 container로 범위를 정해줌
    ///container는 안에 들고 있는 것들을 decorate하기 위해 사용
    return Transform.translate(
      offset: cardOffset,
      child: Container(
        ///clipBehavior는 container의 어떤 아이템이 overflow되었을 때 넘쳐나는 부분을 어떻게 처리할지 결정하는 widget
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor,

          ///둥근 모서리
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          ///symmetric으로 쓰면 reft, right, top, down 따로 설정 필요 없이 vertical ,horizontal로 설정
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                      color: currencyColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ///height : 위아래 벌리기, width  옆으로 벌리기
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        rate,
                        style: TextStyle(
                          fontSize: 18,
                          color: rateColor.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        currencyUnit,
                        style: TextStyle(
                          fontSize: 18,
                          color: currencyUnitColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ///icon의 사이즈를 늘리면 아이콘을 담고 있는 column, row도 같이 커지게 되는데, 아이콘만 크게 해서 overflow 형태를 보이고 싶으면 transform 사용
              ///scale은 몇배로 크게 할 것인지 설정
              Transform.scale(
                scale: 2,

                ///크게 만든 다음 위치를 조정하기 위해 translate 사용
                child: Transform.translate(
                  offset: const Offset(-5, 10),
                  child: icons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
