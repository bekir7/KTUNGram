import 'package:flutter/material.dart';
import 'package:KTUNGram/allConstants/color_constants.dart';
import 'package:KTUNGram/allProvider/auth_provider.dart';
import 'package:KTUNGram/allScreens/home_page.dart';
import 'package:KTUNGram/allScreens/login_page.dart';
import 'package:provider/src/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/ktun.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "KTUN Sohbet Uygulaması",
              style: TextStyle(color: ColorConstants.themeColor),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: ColorConstants.themeColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
