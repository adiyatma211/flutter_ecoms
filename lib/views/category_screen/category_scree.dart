// category_screen.dart
import 'package:emart_app/api/api_services.dart';
import 'package:emart_app/consts/styles.dart';
import 'package:emart_app/model/brandmodel/mdlbrand.dart';
import 'package:emart_app/views/category_screen/category_details.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<getBrand?> futureBrands = Future.value(null);

  @override
  void initState() {
    super.initState();
    getTokenAndFetchBrands();
  }

  Future<void> getTokenAndFetchBrands() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      setState(() {
        futureBrands = ApiServices().getBrands(token);
      });
    } else {
      // Handle token not found error
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories', style: TextStyle(fontFamily: bold)),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: FutureBuilder<getBrand?>(
            future: futureBrands,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data?.data != null) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => CategoryDetails(
                            title: snapshot.data!.data![index].name!,
                            items: snapshot.data!.data![index].items ?? [],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/${snapshot.data!.data![index].logo}'),
                              height: 120,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              snapshot.data!.data![index].name!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return Center(child: Text('No data available'));
            },
          ),
        ),
      ),
    );
  }
}
