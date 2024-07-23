import 'package:craftmani/views/app_home/pages/client_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../exports.dart';
import '../views/app_home/screens/craft_men/craft_man_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var sess = "";
  void _validateUser() async {

    dynamic session = await SessionManager().get("user_token");

    if(session != null){
      var userid = session.split("_");
      switch(userid[0]){
        case "isCraftman":
          Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CraftManHome())));
          break;
        case "isNotCraftman":
          Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ClientHome())));
          break;
        default:
          Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const WelcomePage())));
      }
    } else {
      Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CraftManHome())));
    }
  }

  @override
  void initState() {
    _validateUser();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                //debugPrint(sess);
              },
              child: BrandLogo(
                color: Colors.black,
                size: 90,
              ),
            ),
            SizedBox(height: 10),
            Text('CraftMani',
              style: TextStyle(
                color: ThemeColor.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Powered by ',
              textAlign: TextAlign.center,
            ),
            Text('Afrikapture',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
