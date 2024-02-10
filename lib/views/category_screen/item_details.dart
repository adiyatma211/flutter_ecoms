import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swipper
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: 3,
                        aspectRatio: 16 / 9,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgB1,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .xl
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    'Price: \$100'
                        .text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "hahah"
                                .text
                                .white
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(16)
                                .make(),
                          ],
                        )),
                        CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_rounded,
                            color: blueColor,
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(68)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .rounded
                        .make(),
                    20.heightBox,

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Color'
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make(),

                                //quantity
                              ),
                            ),
                          ],

                          //quantity
                        ).box.padding(EdgeInsets.all(8)).make(),

                        //Quantity

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Quantitys'
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                                '0'
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                10.heightBox,
                                '(0 Available)'
                                    .text
                                    .fontFamily(semibold)
                                    .make(),
                              ],
                            ),
                          ],
                          //quantity
                        ).box.padding(EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Total'
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .make(),
                            ),
                            '\$0.00'
                                .text
                                .color(blueColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],

                          //quantity
                        ).box.padding(EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    //deskripsi

                    10.heightBox,
                    'Description'
                        .text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .make(),
                    10.heightBox,
                    'This is a very good product'
                        .text
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                  ]),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: blueColor,
                onPress: () {},
                textColor: whiteColor,
                title: 'Add to Cart'),
          ),
        ],
      ),
    );
  }
}
