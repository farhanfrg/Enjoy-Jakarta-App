import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'responsiver.dart';

class ResetPass extends StatefulWidget {
  final String title;
  const ResetPass({Key? key, required this.title}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPass();
}

class _ResetPass extends State<ResetPass> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);
    return Scaffold(
      backgroundColor: Color(0xfffefafa),
      body: Center(
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
                    "Lupa kata sandimu?",
                    style: TextStyle(
                        color: themeSetup.mainTextColor,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w700,
                        fontSize: resp.responsiver(height, 17)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Masukkan email yang sudah terdaftar di akun Enjoy Jakarta untuk mengatur ulang kata sandimu",
                      style: TextStyle(
                        color: themeSetup.mainTextColor,
                        fontFamily: "Plus Jakarta",
                        fontWeight: FontWeight.w500,
                        fontSize: resp.responsiver(height, 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: stebPadding,
                right: stebPadding,
                top: resp.responsiver(height, 40),
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
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: stebPadding,
                    right: stebPadding,
                    bottom: stebPadding,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: resp.responsiver(height, 45),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeSetup.accentColor,
                      ),
                      onPressed: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SplashScreenWidget(
                        //             title: "Splash Screen")));
                        // print("Button Pressed");
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
                        "Kirim Email",
                        style: TextStyle(
                            color: themeSetup.white,
                            fontFamily: "Plus Jakarta",
                            fontWeight: FontWeight.w700,
                            fontSize: resp.responsiver(height, 16)),
                      ),
                    ),
                  ),
                ),
              ),
            ), //Login Button
          ],
        ),
      ),
    );
  }
}
