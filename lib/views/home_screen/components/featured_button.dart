import 'package:emart_app/consts/consts.dart';

Widget featuredButton({icon, String? title}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 65,
        fit: BoxFit.fill,
      ),
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(8))
      .roundedSM
      .outerShadowSm
      .make();
}
