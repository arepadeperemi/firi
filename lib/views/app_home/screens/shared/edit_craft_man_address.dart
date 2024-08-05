import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';


class EditCraftManAddress extends StatefulWidget {
  const EditCraftManAddress({Key? key}) : super(key: key);

  @override
  State<EditCraftManAddress> createState() => _EditCraftManAddressState();
}

class _EditCraftManAddressState extends State<EditCraftManAddress> {

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
                    Text('Address',
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
                  labelText: 'Address',
                  icon: Icons.edit_location_alt,
                  inputAction: TextInputAction.done,
                  inputController: nameController,
                  inputType: TextInputType.text
              ),
                  const SizedBox(height: 10,),
                  const Text("Edit your offline address. This address allows clients to find you when your live location is disabled.",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
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
