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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
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
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(-5, 10),
                child: icons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
