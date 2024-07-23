import 'package:craftmani/views/authenticate/login.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:transition/transition.dart';
import '../exports.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: headers.length,
          itemBuilder: (_, currentIndex){
            return Padding(
              padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrandLogo(
                      alignment: MainAxisAlignment.start,
                      color: Colors.black,
                      size: 60,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Lottie.asset("assets/lottie/${lottie[currentIndex]}")
                    ),
                    const SizedBox(height: 50),
                    Text(headers[currentIndex],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(description[currentIndex],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Row(
                      children: List.generate(headers.length, (index){
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 10,
                          width: index == currentIndex ? 30 : 10,
                          decoration: BoxDecoration(
                              color: index == currentIndex ? ThemeColor.primary.withOpacity(.5) : Colors.black12,
                              borderRadius: BorderRadius.circular(100)
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: GestureDetector(
          onTap: () => {
            Navigator.push(context, Transition(child: const LoginPage(),
              transitionEffect: TransitionEffect.BOTTOM_TO_TOP)
            )
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
                color: ThemeColor.primary,
                borderRadius: BorderRadius.circular(10)
            ),
            child: const Text('Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                )
            ),
          ),
        ),
      ),
    );
  }
}
