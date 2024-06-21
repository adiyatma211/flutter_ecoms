import 'package:emart_app/consts/images.dart';
import 'package:emart_app/views/cart_screen/cart_controller.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';
// import 'package:emart_app/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/styles.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:get/get.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  final String? imageitem;
  final String? price;

  const ItemDetails(
      {Key? key,
      required this.title,
      required this.price,
      required this.imageitem})
      : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 0;
  String name = '';
  String address = '';
  String shippingMethod = '';
  final CartController cartController = Get.find<CartController>();

  double get totalPrice => quantity * double.parse(widget.price ?? '0');

  void addToCart(BuildContext context) {
    if (quantity > 0) {
      cartController.addItemToCart(
          widget.title ?? '', widget.price ?? '', quantity);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${widget.title ?? ''} added to cart!'),
          duration: Duration(seconds: 2),
        ),
      );

      Get.to(() => CartScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one item'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
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
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/images/${widget.imageitem ?? 'default_logo.png'}',
                          width: 200,
                          height: 160,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    widget.title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .xl
                        .make(),
                    10.heightBox,
                    widget.price!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .xl
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: 'Quantity'
                              .text
                              .size(16)
                              .color(darkFontGrey)
                              .make(),
                        ),
                        IconButton(
                          onPressed: () {
                            if (quantity > 0) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('$quantity')
                            .text
                            .size(16)
                            .color(darkFontGrey)
                            .make(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text('(Available)').text.make(),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child:
                              'Total'.text.size(16).color(darkFontGrey).make(),
                        ),
                        Text('\$${totalPrice.toStringAsFixed(2)}')
                            .text
                            .color(blueColor)
                            .size(16)
                            .make(),
                      ],
                    ).box.padding(EdgeInsets.all(8)).make(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: blueColor,
              onPress: () => addToCart(context),
              textColor: whiteColor,
              title: 'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }
}
