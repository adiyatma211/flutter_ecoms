import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/views/auth_screen/singup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widget_common/applogo_widget.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/api/api_services.dart'; // Import file api_services.dart
import 'package:emart_app/repo/loginrepo.dart'; // Import file login_model.dart
import 'package:emart_app/model/mdlLogin.dart'; // Import file mdlLogin.dart

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    customTextField(
                      controller: passwordController,
                      hint: passwordHint,
                      title: password,
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
                      title: 'Login',
                      textColor: whiteColor,
                      onPress: login,
                    ).box.width(context.screenWidth - 50).make(),
                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
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
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                15.heightBox,
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



// import 'package:emart_app/consts/consts.dart';
// import 'package:emart_app/consts/list.dart';
// import 'package:emart_app/views/auth_screen/singup_screen.dart';
// import 'package:emart_app/views/home_screen/home.dart';
// import 'package:emart_app/widget_common/applogo_widget.dart';
// import 'package:emart_app/widget_common/bg_widget.dart';
// import 'package:emart_app/widget_common/custom_textfield.dart';
// import 'package:emart_app/widget_common/our_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return bgWidget(
//         child: Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             (context.screenHeight * 0.1).heightBox,
//             applogoWidget(),
//             10.heightBox,
//             "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
//             10.heightBox,
//             Column(
//               children: [
//                 customTextField(hint: nameHint, title: name),
//                 customTextField(hint: passwordHint, title: password),
//                 Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                         onPressed: () {}, child: forgetPass.text.make())),
//                 5.heightBox,
//                 // ourButton().box.width(context.screenWidth - 50).make(),
//                 ourButton(
//                     color: blueColor,
//                     title: login,
//                     textColor: whiteColor,
//                     onPress: () {
//                       Get.to(() => const Home());
//                     }).box.width(context.screenWidth - 50).make(),

//                 5.heightBox,
//                 createNewAccount.text.color(fontGrey).make(),
//                 5.heightBox,
//                 ourButton(
//                     color: blueColor,
//                     title: singup,
//                     textColor: whiteColor,
//                     onPress: () {
//                       Get.to(() => const SingupScreen());
//                     }).box.width(context.screenWidth - 50).make(),
//               ],
//             )
//                 .box
//                 .white
//                 .rounded
//                 .padding(const EdgeInsets.all(16))
//                 .width(context.screenWidth - 70)
//                 .shadowSm
//                 .make(),
//             10.heightBox,
//             loginWith.text.color(fontGrey).make(),
//             15.heightBox,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                   3,
//                   (index) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundColor: lightGrey,
//                           radius: 25,
//                           child: Image.asset(
//                             socialIconList[index],
//                             width: 30,
//                           ),
//                         ),
//                       )),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
