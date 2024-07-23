import 'dart:convert';

import 'package:craftmani/api/request.dart';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/pages/client_home.dart';
import 'package:craftmani/views/app_home/screens/craft_men/craft_man_home.dart';
import 'package:craftmani/views/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';

import '../../api/convert.dart';
import '../../widgets/back_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = false;
  var serverResponse = "";
  var numberField = "";
  var passwordField = "";



  loginUser() async {

    try{

      if(numberController.text != "" && passwordController.text != "")
      {
        isLogin = true;

        var data = {
          'action': 'login_user',
          'phone': numberController.text,
          'password': Convert().generateMd5(passwordController.text)
        };

        var res = await Requests().loginUser(data, "/request/loginUser");

        res = jsonDecode(res.body);
        if(res['success']){
          await SessionManager().set("user_token", res['data']['token']);
          setState(() {
            switch(res['data']['acc_type']){
              case "isCraftman":
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CraftManHome()));
                break;
              case "isNotCraftman":
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ClientHome()));
                break;
              default:
                null;
            }
            isLogin = false;
          });
        } else{
          serverResponse = res['data']['message'];
          isLogin = false;
        }

      }


      setState((){
        if(numberController.text == "") {
          numberField = "Enter phone number";
        } else {
          numberField = "";
        }
        if(passwordController.text == ""){
          passwordField = "Enter password";
        } else {
          passwordField = "";
        }
      });

    } catch(e){
      setState(() {
        serverResponse = e.toString();
      });
    }

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreviousPage(color: ThemeColor.black),
              SizedBox(height: 20),
              BrandLogo(
                alignment: MainAxisAlignment.start,
                size: 60,
              ),
              SizedBox(height: 25),

              HeaderText(text: 'Welcome to CraftMani'),
              SizedBox(height: 10),
              DescriptionText(text: 'Login to your account to find craft men near your current location'),
              SizedBox(height: 20),
              CustomAlert(infoText: serverResponse),
              SizedBox(height: 5),
              CustomInput(labelText: 'Phone', icon: Icons.phone, inputAction: TextInputAction.next, inputController: numberController, inputType: TextInputType.phone, inputError: numberField,),
              SizedBox(height: 5),
              CustomInput(labelText: 'Password', isPassword: true, icon: Icons.lock, inputAction: TextInputAction.done, inputController: passwordController, inputType: TextInputType.text, inputError: passwordField,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthText(text: "I Don't Have an Account",
                      onPressed: (){
                        Navigator.push(context, Transition(child: const RegisterOne(),
                            transitionEffect: TransitionEffect.BOTTOM_TO_TOP)
                        );
                  }),
                  AuthText(text: "Forgot Password?",
                      onPressed: (){
                        Navigator.push(context, Transition(child: const LoginPage(),
                            transitionEffect: TransitionEffect.BOTTOM_TO_TOP)
                        );
                      }),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.5, color: ThemeColor.black)
                      ),
                      child: Image.asset('assets/images/google-login-1820249355',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Google signin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ThemeColor.black,
                          fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: GestureDetector(
          onTap: () => {
            setState(() => {
              loginUser()
            })
          },
            child: SubmitButton(text: "Login", isLoading: isLogin)),
      ),
    );
  }
}
