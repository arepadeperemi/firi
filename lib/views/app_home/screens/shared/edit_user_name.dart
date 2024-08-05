import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';


class EditUserName extends StatefulWidget {
  const EditUserName({Key? key}) : super(key: key);

  @override
  State<EditUserName> createState() => _EditUserNameState();
}

class _EditUserNameState extends State<EditUserName> {

  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PreviousPage(icon: Icons.arrow_back_ios_rounded, color: ThemeColor.black,size: 30),
                  SizedBox(width: 10),
                  Text('Full Name',
                    style: TextStyle(
                        color: ThemeColor.black,
                        fontSize: 16,
                        fontFamily: 'Poppins'
                    ),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomInput(
                    labelText: 'Full Name',
                    icon: Icons.person,
                    inputAction: TextInputAction.done,
                    inputController: nameController,
                    inputType: TextInputType.text
                ),
                const SizedBox(height: 10,),
                const Text("Here you change your full name. It doesn't necessarily need to be your official name. But it's good to have your name in sync.",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  //updateAddress();
                });
              },
              child: const SubmitButton(text: "Update")
          ),
        )
    );
  }
}
