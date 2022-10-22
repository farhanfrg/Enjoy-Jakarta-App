import 'package:enjoyjakarta/regist_screen.dart';
import 'package:enjoyjakarta/reset_pass.dart';
import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'responsiver.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);
    return Scaffold(
      backgroundColor: const Color(0xfffefafa),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: resp.responsiver(height, 70),
            ),
            Image.asset(
              'assets/images/mainlogo.png',
              width: 288,
              height: 100,
              fit: BoxFit.cover,
            ), // Main Logo
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        color: themeSetup.mainTextColor,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w500,
                        fontSize: resp.responsiver(height, 16)),
                  )
                ],
              ),
            ), // Email Text Field Label
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: SizedBox(
                height: resp.responsiver(height, 46),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Ketik disini",
                    hintStyle: TextStyle(
                        color: themeSetup.secondaryTextColor,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w300,
                        fontSize: resp.responsiver(height, 13)),
                    filled: true,
                    fillColor: themeSetup.textFieldColor,
                  ),
                ),
              ),
            ), // Email Text Field
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kata Sandi",
                    style: TextStyle(
                      color: themeSetup.mainTextColor,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w500,
                      fontSize: resp.responsiver(height, 16),
                    ),
                  )
                ],
              ),
            ), // Password Text Field Label
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: SizedBox(
                height: resp.responsiver(height, 46),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "*********",
                    hintStyle: TextStyle(
                        color: themeSetup.secondaryTextColor,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w300,
                        fontSize: resp.responsiver(height, 14)),
                    filled: true,
                    fillColor: themeSetup.textFieldColor,
                  ),
                ),
              ),
            ), // Password Text Field
            Padding(
                padding: EdgeInsets.only(
                  left: stebPadding,
                  right: stebPadding,
                  top: resp.responsiver(height, 10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(
                                () {
                                  this.rememberMe = value;
                                },
                              );
                            }
                          },
                          value: this.rememberMe,
                        ),
                        Text("Ingat saya",
                            style: TextStyle(
                              color: themeSetup.secondaryTextColor,
                              fontFamily: "Plus Jakarta",
                              fontWeight: FontWeight.w300,
                              fontSize: resp.responsiver(height, 14),
                            ),
                            textAlign: TextAlign.left)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: resp.responsiver(height, 15),
                          color: themeSetup.alertColor,
                        ),
                        Text(
                          " Kata sandi/email anda salah",
                          style: TextStyle(
                            color: themeSetup.alertColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w300,
                            fontSize: resp.responsiver(height, 14),
                          ),
                        )
                      ],
                    )
                  ],
                )), // Alert
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 25),
              ),
              child: Container(
                width: double.infinity,
                height: resp.responsiver(height, 45),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: themeSetup.accentColor,
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreenWidget(
                                title: "Splash Screen")));
                    print("Button Pressed");
                    // var url = Uri.https('devgeosys.com', 'api/token', {
                    //   "email": "andi@gmail.com",
                    //   "password": r"Sup3rsecret$Passw0rd!",
                    //   "device_name": "coba"
                    // });
                    // var response = await http.post(url);
                    // print(url);
                    // print('Response status: ${response.statusCode}');
                    // print('Response body: ${response.body}');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: themeSetup.white,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w700,
                        fontSize: resp.responsiver(height, 16)),
                  ),
                ),
              ),
            ), //Login Button
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: themeSetup.black,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w400,
                        fontSize: resp.responsiver(height, 14),
                      ),
                      text: "Lupa password?",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPass(title: "Reset Password"),
                            ),
                          );
                        },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 1,
                          endIndent: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'atau',
                        style: TextStyle(
                            color: themeSetup.mainTextColor,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w400,
                            fontSize: resp.responsiver(height, 14)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 1,
                          indent: 10,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // Atau Divider
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 20),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: resp.responsiver(height, 45),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: themeSetup.white),
                      onPressed: () {
                        print("Button Pressed");
                      },
                      child: Text(
                        "Login melalui Google",
                        style: TextStyle(
                          color: themeSetup.black,
                          fontFamily: "Plus Jakarta",
                          fontWeight: FontWeight.w500,
                          fontSize: resp.responsiver(height, 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: stebPadding),
                    child: Container(
                      width: resp.responsiverw(width, 25),
                      height: resp.responsiverw(width, 25),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/google-logo.png',
                      ),
                    ),
                  ),
                ],
              ),
            ), // Google Login Divider
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tidak memiliki akun?",
                    style: TextStyle(
                      color: themeSetup.black,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w400,
                      fontSize: resp.responsiver(height, 14),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: themeSetup.blue,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w400,
                        fontSize: resp.responsiver(height, 14),
                      ),
                      text: " Daftar sekarang",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegistScreen(title: "Regist Screen"),
                            ),
                          );
                        },
                    ),
                  )
                ],
              ),
            ), //Registrasi Path
          ],
        ),
      ),
    );
  }
}
