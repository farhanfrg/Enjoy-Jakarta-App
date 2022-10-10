import 'package:enjoyjakarta/splashscreen.dart';
import 'package:enjoyjakarta/theme_setup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'responsiver.dart';

class RegistScreen extends StatefulWidget {
  final String title;
  const RegistScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<RegistScreen> createState() => _RegistScreen();
}

class _RegistScreen extends State<RegistScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double stebPadding = resp.responsiverw(width, 20);

    double registNum = 3;

    var frameRegister = {
      1: 'assets/images/frameRegister1.svg',
      2: 'assets/images/frameRegister2.svg',
      3: 'assets/images/frameRegister3.svg'
    };

    var registData = {
      "Username": "",
      "Nama Lengkap": "",
      "Handphone Aktif": "",
      "Tanggal Lahir": "",
      "Jenis Kelamin": "",
      "Negara Asal": "",
      "Email": "",
      "Kata Sandi": "",
      "Konfirmasi Kata Sandi": "",
    };

    var registPage = {
      "Username": 1,
      "Nama Lengkap": 1,
      "Handphone Aktif": 1,
      "Tanggal Lahir": 2,
      "Jenis Kelamin": 2,
      "Negara Asal": 2,
      "Email": 3,
      "Kata Sandi": 3,
      "Konfirmasi Kata Sandi": 3,
    };

    var registType = {
      "Username": "Uname",
      "Nama Lengkap": "String",
      "Handphone Aktif": "Phone",
      "Tanggal Lahir": "Date",
      "Jenis Kelamin": "Gender",
      "Negara Asal": "Country",
      "Email": "Email",
      "Kata Sandi": "Pass",
      "Konfirmasi Kata Sandi": "Pass",
    };

    void getPage(Map map, double page) {
      map.forEach(
        (key, value) {
          if (value == page) {
            print(key);
          }
        },
      );
    }

    getPage(registPage, registNum);

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
                    "Username",
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
                    "Nama Lengkap",
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
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
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
            ),
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
                    "Handphone Aktif",
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
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
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
                    "Lanjutkan",
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
                        Divider(
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
                        Divider(
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
                      decoration: BoxDecoration(
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
                  Text(
                    " Daftar Sekarang",
                    style: TextStyle(
                      color: themeSetup.blue,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.w400,
                      fontSize: resp.responsiver(height, 14),
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
