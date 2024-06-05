import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/model/mdlRegister.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/api/api_services.dart'; // Import file api_services.dart
import 'package:emart_app/repo/loginrepo.dart'; // Import file login_model.dart
import 'package:emart_app/model/mdlLogin.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  Future<void> register() async {
    if (passwordController.text != retypePasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match. Please try again.')),
      );
      return;
    }

    RegisterModel registerData = RegisterModel(
      name: nameController.text,
      email: emailController.text,
      confiramtionpassword: retypePasswordController.text,
      password: passwordController.text,
    );
    ApiServices apiServices = ApiServices();
    getLogin? registerResponse = await apiServices.register(registerData);

    if (registerResponse != null && registerResponse.success == true) {
      // Register berhasil, lakukan navigasi ke halaman berikutnya
      Get.to(() => Home());
    } else {
      // Register gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Sing UP to $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(
                    controller: nameController,
                    hint: nameHint,
                    title: name,
                  ),
                  customTextField(
                    controller: emailController,
                    hint: emailHint,
                    title: email,
                  ),
                  customTextField(
                    controller: passwordController,
                    hint: passwordHint,
                    title: password,
                  ),
                  customTextField(
                    controller: retypePasswordController,
                    hint: retypePasswordHint,
                    title: retypePassword,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  ourButton(
                    color: blueColor,
                    title: singup,
                    textColor: whiteColor,
                    onPress: register,
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(color: fontGrey)),
                        TextSpan(
                            text: login, style: TextStyle(color: blueColor)),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  })
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
