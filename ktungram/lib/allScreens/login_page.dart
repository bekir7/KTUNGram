import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:KTUNGram/allModels/user_chat.dart';
import 'package:KTUNGram/allWidgets/loading_view.dart';
import 'package:provider/provider.dart';
import 'package:KTUNGram/allProvider/auth_provider.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "signin fail");
        break;
      case Status.authenticateanceled:
        Fluttertoast.showToast(msg: "signin canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "signin succesfull");
        break;
      default:
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset("images/back.png"),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () async {
                bool isSuccess = await authProvider.handleSignIn();
                if (isSuccess) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: Image.asset(
                "images/a.png",
                height: 200,
                width: 200,
              ),
            ),
          ),
          Positioned(
            child: authProvider.status == Status.authenticating
                ? LoadingView()
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
