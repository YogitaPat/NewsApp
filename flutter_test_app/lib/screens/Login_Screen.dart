
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/common/Error_Dailog.dart';
import 'package:flutter_test_app/common/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'News_Screen.dart';

var authProvider;

TextEditingController emailController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void _togglePassword() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }


    var postDataLogin = () async {
      String email = emailController.text;
      String password = pwdController.text;

      if (emailController.text.trim().length == 0) {
        Fluttertoast.showToast(
            msg: "Email address is Required",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      } else if (!Utils.isEmail(emailController.text)) {
        Fluttertoast.showToast(
            msg: "Please Enter valid email address",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      } else if (pwdController.text.trim().length == 0) {
        Fluttertoast.showToast(
            msg: "Password is Required",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
            );
      }
      else if (!Utils.isPass(pwdController.text)) {
        Fluttertoast.showToast(
            msg: "Password should contain at least one upper case,lower case,digit,Special character and Must be at least 8 characters in length",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.red,
            backgroundColor: Colors.black54,
            gravity: ToastGravity.CENTER // also possible "TOP" and "CENTER"
        );
      }
      else if (await Utils.checkInternetConnectivity()) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => NewsListPage()));

      } else {
        showDialog<dynamic>(
            context: context,
            builder: (BuildContext context) {
              return ErrorDialog(
                  message: "Please check your internet connection !");
            });
      }
    };

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
            // alignment: Alignment.center,
            constraints: BoxConstraints.expand(),
            child: SingleChildScrollView(
                child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 140.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                        ],
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'johnwick@gmail.com'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        obscureText: _obscureText,
                        controller: pwdController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                _togglePassword();
                              },
                            ),
                            // border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 290,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: MaterialButton(
                      onPressed: () {
                        postDataLogin();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),

                ],
              ),
            )))
      ],
    ));
  }
}
