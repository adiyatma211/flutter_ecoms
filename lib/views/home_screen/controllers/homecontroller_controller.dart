import 'package:emart_app/api/api_services.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';
import '../../../model/brandmodel/mdlbrand.dart';

class HomecontrollerController extends GetxController {
  final brands = <Data>[].obs;

  final count = 0.obs;
  final ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    try {
      String? token = await UserService.getToken();
      if (token != null) {
        getBrand? brandData = await apiServices.getBrands(token);
        if (brandData != null && brandData.data != null) {
          brands.assignAll(brandData.data!);
        } else {
          Get.snackbar('Error', 'Failed to load brands');
        }
      } else {
        Get.snackbar('Error', 'Token not found. Please log in again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to connect to the server');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Widget buildBrandLogo(String logoUrl) {
    return Image.network(
      logoUrl,
      width: 100, // Sesuaikan ukuran gambar sesuai kebutuhan
      height: 100,
      fit: BoxFit.cover, // Sesuaikan fit gambar sesuai kebutuhan
    );
  }
}
