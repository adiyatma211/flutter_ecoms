import 'package:emart_app/model/brandmodel/mdlbrand.dart';
import 'package:emart_app/views/category_screen/category_details.dart';
import 'package:emart_app/views/home_screen/components/featured_button.dart';
import 'package:emart_app/views/home_screen/controllers/homecontroller_controller.dart';
import 'package:emart_app/widget_common/home_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:get/get.dart';

import '../category_screen/item_details.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Instantiate the controller
//     final HomecontrollerController controller =
//         Get.put(HomecontrollerController());

//     void someFunction() {
//       // Mendapatkan merek pertama dari list brands
//       Data firstBrand =
//           controller.brands.isNotEmpty ? controller.brands[0] : Data();

//       // Mengakses brandId
//       int? brandId = firstBrand.id;

//       print('Brand ID: $brandId');
//     }

//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: lightGrey,
//       width: context.screenWidth,
//       height: context.screenHeight,
//       child: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 60,
//               color: lightGrey,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   suffixIcon: Icon(Icons.search),
//                   filled: true,
//                   fillColor: whiteColor,
//                   hintText: searchanything,
//                   hintStyle: TextStyle(color: textfieldGrey),
//                 ),
//               ),
//             ),
//             // swipper
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     // feature Categories
//                     20.heightBox,
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         featuredCategories,
//                         style: TextStyle(
//                           fontFamily: semibold,
//                           fontSize: 18,
//                           color: darkFontGrey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     20.heightBox,
//                     Obx(
//                       () {
//                         if (controller.brands.isEmpty) {
//                           return Center(child: CircularProgressIndicator());
//                         } else {
//                           return GridView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2, // Jumlah kolom dalam grid
//                               mainAxisSpacing:
//                                   16, // Spasi antara item pada sumbu utama (vertikal)
//                               crossAxisSpacing:
//                                   16, // Spasi antara item pada sumbu silang (horizontal)
//                               childAspectRatio:
//                                   0.8, // Perbandingan aspek setiap item (lebar/tinggi)
//                             ),
//                             itemCount: controller.brands.length,
//                             itemBuilder: (context, index) {
//                               Data brand = controller.brands[index];

//                               // Menggunakan AssetImage dengan path dari assets dan nilai default
//                               AssetImage assetImage = AssetImage(
//                                 'assets/images/${brand.logo ?? 'default_logo.png'}',
//                               );

//                               return Card(
//                                 elevation: 4,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 120,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(12),
//                                           topRight: Radius.circular(12),
//                                         ),
//                                         image: DecorationImage(
//                                           image: assetImage,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(12),
//                                       child: Text(
//                                         brand.name ??
//                                             '', // Contoh: default value untuk nama jika null
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         }
//                       },
//                     ),
//                     // Featured Product
//                     20.heightBox,
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: blueColor,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           'Featured Products'
//                               .text
//                               .white
//                               .fontFamily(bold)
//                               .size(18)
//                               .make(),
//                           20.heightBox,
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: controller.brands.isEmpty
//                                   ? [Text('No brands available')]
//                                   : List.generate(controller.brands.length,
//                                       (brandIndex) {
//                                       Data brand =
//                                           controller.brands[brandIndex];
//                                       List<Items>? items = brand.items;
//                                       return Row(
//                                         children: List.generate(
//                                           items!.length,
//                                           (itemIndex) {
//                                             Items item = items[itemIndex];

//                                             return Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Image.asset(
//                                                   'assets/images/${item.imageitem ?? 'default_logo.png'}',
//                                                   width: 150,
//                                                   height: 150,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                                 10.heightBox,
//                                                 item.name!.text
//                                                     .fontFamily(semibold)
//                                                     .color(darkFontGrey)
//                                                     .make(),
//                                                 10.heightBox,
//                                                 '\$${item.price ?? 0}'
//                                                     .text
//                                                     .fontFamily(bold)
//                                                     .color(blueColor)
//                                                     .size(16)
//                                                     .make(),
//                                               ],
//                                             )
//                                                 .box
//                                                 .white
//                                                 .margin(
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 4))
//                                                 .roundedSM
//                                                 .padding(
//                                                     const EdgeInsets.all(8))
//                                                 .make();
//                                           },
//                                         ),
//                                       );
//                                     }),
//                             ),
//                           ),
//                           20.heightBox,
//                           GridView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: controller.brands.isEmpty ? 0 : 6,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 8,
//                               crossAxisSpacing: 8,
//                               mainAxisExtent: 300,
//                             ),
//                             itemBuilder: (context, index) {
//                               if (controller.brands.isEmpty) {
//                                 return Container(); // Atau widget yang menunjukkan bahwa tidak ada data
//                               }
//                               Data brand = controller
//                                   .brands[index % controller.brands.length];
//                               Items item =
//                                   brand.items![index % brand.items!.length];

//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/${item.imageitem ?? 'default_logo.png'}',
//                                     width: 200,
//                                     height: 160,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   const Spacer(),
//                                   10.heightBox,
//                                   item.name!.text
//                                       .fontFamily(semibold)
//                                       .color(darkFontGrey)
//                                       .make(),
//                                   10.heightBox,
//                                   '\$${item.price ?? 0}'
//                                       .text
//                                       .fontFamily(bold)
//                                       .color(blueColor)
//                                       .size(16)
//                                       .make(),
//                                 ],
//                               )
//                                   .box
//                                   .white
//                                   .margin(
//                                       const EdgeInsets.symmetric(horizontal: 4))
//                                   .roundedSM
//                                   .padding(const EdgeInsets.all(12))
//                                   .make();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomecontrollerController controller =
        Get.put(HomecontrollerController());

    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[200],
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.grey[200],
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Anything',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Featured Categories',
                        style: TextStyle(
                          fontFamily: 'Semibold',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    20.heightBox,
                    Obx(
                      () {
                        if (controller.brands.isEmpty) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: controller.brands.length,
                            itemBuilder: (context, index) {
                              Data brand = controller.brands[index];

                              return GestureDetector(
                                onTap: () {
                                  // Navigasi ke halaman detail dengan membawa data brand yang diperlukan
                                  Get.to(() => CategoryDetails(
                                        title: brand.name ?? 'No Name',
                                        items: brand.items ?? [],
                                      ));
                                },
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/${brand.logo ?? 'default_logo.png'}',
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          brand.name ?? '',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'Featured Products'
                              .text
                              .white
                              .fontFamily('Bold')
                              .size(18)
                              .make(),
                          20.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.brands.isEmpty
                                  ? [
                                      Text('No brands available')
                                          .text
                                          .color(Colors.black)
                                          .make()
                                    ]
                                  : List.generate(controller.brands.length,
                                      (brandIndex) {
                                      Data brand =
                                          controller.brands[brandIndex];
                                      List<Items>? items = brand.items;

                                      return Row(
                                        children: List.generate(items!.length,
                                            (itemIndex) {
                                          Items item = items[itemIndex];

                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(() => ItemDetails(
                                                    title:
                                                        item.name ?? 'No Name',
                                                    imageitem: item.imageitem,
                                                    price: item.price
                                                            ?.toString() ??
                                                        'Price not available',
                                                  ));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/images/${item.imageitem ?? 'default_logo.png'}',
                                                  width: 150,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                                10.heightBox,
                                                item.name!.text
                                                    .fontFamily('Semibold')
                                                    .color(Colors.black)
                                                    .make(),
                                                10.heightBox,
                                                '\$${item.price ?? 0}'
                                                    .text
                                                    .fontFamily('Bold')
                                                    .color(Colors.blue)
                                                    .size(16)
                                                    .make(),
                                              ],
                                            )
                                                .box
                                                .white
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4))
                                                .roundedSM
                                                .padding(
                                                    const EdgeInsets.all(8))
                                                .make(),
                                          );
                                        }),
                                      );
                                    }),
                            ),
                          ),
                          20.heightBox,
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.brands.isEmpty ? 0 : 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                            ),
                            itemBuilder: (context, index) {
                              if (controller.brands.isEmpty) {
                                return Container();
                              }
                              Data brand = controller
                                  .brands[index % controller.brands.length];
                              Items item =
                                  brand.items![index % brand.items!.length];

                              return GestureDetector(
                                onTap: () {
                                  // Navigasi ke ItemDetails saat item di-klik
                                  Get.to(
                                    () => ItemDetails(
                                      title: item.name ?? 'No Name',
                                      imageitem: item.imageitem,
                                      price: item.price?.toString() ??
                                          'Price not available',
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/${item.imageitem ?? 'default_logo.png'}',
                                      width: 200,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                    const Spacer(),
                                    10.heightBox,
                                    item.name!.text
                                        .fontFamily('Semibold')
                                        .color(Colors.black)
                                        .make(),
                                    10.heightBox,
                                    '\$${item.price ?? 0}'
                                        .text
                                        .fontFamily('Bold')
                                        .color(Colors.blue)
                                        .size(16)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(12))
                                    .make(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
