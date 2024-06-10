import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/api/api_services.dart';
import 'package:emart_app/repo/loginrepo.dart';
import 'package:emart_app/model/mdlLogin.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/views/auth_screen/singup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isObscured = true;

  Future<void> login() async {
    LoginRepo loginData = LoginRepo(
      email: emailController.text,
      password: passwordController.text,
    );
    ApiServices apiServices = ApiServices();
    getLogin? loginResponse = await apiServices.login(loginData);

    if (loginResponse != null && loginResponse.success == true) {
      // Login berhasil, lakukan navigasi ke halaman berikutnya
      Get.to(() => const Home());
    } else {
      // Login gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Log in to $appname"
                    .text
                    .fontFamily(bold)
                    .white
                    .size(18)
                    .make(),
                10.heightBox,
                Column(
                  children: [
                    customTextField(
                      controller: emailController,
                      hint: nameHint,
                      title: name,
                    ),
                    SizedBox(height: 10),
                    // TextField untuk password
                    TextField(
                      controller: passwordController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        labelText: password,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPass.text.make(),
                      ),
                    ),
                    SizedBox(height: 5),
                    ourButton(
                      color: blueColor,
                      title: 'Login',
                      textColor: whiteColor,
                      onPress: login,
                    ).box.width(context.screenWidth - 50).make(),
                    SizedBox(height: 5),
                    createNewAccount.text.color(fontGrey).make(),
                    SizedBox(height: 5),
                    ourButton(
                      color: blueColor,
                      title: singup,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const SingupScreen());
                      },
                    ).box.width(context.screenWidth - 50).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
                SizedBox(height: 10),
                loginWith.text.color(fontGrey).make(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(
                          socialIconList[index],
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
