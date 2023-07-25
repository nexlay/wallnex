import 'package:flutter/material.dart';
import '../../../../../const/const.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';

class SubscriptionOffer extends StatefulWidget {
  const SubscriptionOffer(
      {super.key, required this.currency, required this.price});

  final String currency;
  final String price;

  @override
  State<SubscriptionOffer> createState() => _SubscriptionOfferState();
}

class _SubscriptionOfferState extends State<SubscriptionOffer> {
  List borderSide = [
    const BorderSide(color: Colors.amberAccent),
    const BorderSide(color: Colors.transparent),
  ];
  static const _categories = 1;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      child: GridView.count(
        crossAxisSpacing: kRadius,
        crossAxisCount: borderSide.length,
        children: List<Widget>.generate(
          borderSide.length,
          (index) => ActionChip(
            side: borderSide[index],
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: index == _categories
                        ? Colors.amberAccent.withOpacity(kOpacity)
                        : Colors.grey.withOpacity(kOpacity),
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kRadius),
                    child: index == _categories
                        ? const Icon(
                            Icons.star_border_outlined,
                            color:Colors.amberAccent,
                            size: kSocialIconSize,
                          )
                        : const Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                            size: kSocialIconSize,
                          ),
                  ),
                ),
                Text(
                  index == _categories ? l.prem : l.free,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.currency} ',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: index == _categories ? widget.price : '0.0',
                        style: const TextStyle(
                          fontSize: kSocialIconSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' /${l.month}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                borderSide = borderSide.reversed.toList();
              });
            },
          ),
        ),
      ),
    );
  }
}
