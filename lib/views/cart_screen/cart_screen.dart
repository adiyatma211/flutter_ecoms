import 'package:flutter/foundation.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: "Cart Kosong"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .makeCentered());
  }
}
