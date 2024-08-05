import 'package:country_picker/country_picker.dart';
import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';


class EditUserPhone extends StatefulWidget {
  const EditUserPhone({Key? key}) : super(key: key);

  @override
  State<EditUserPhone> createState() => _EditUserPhoneState();
}

class _EditUserPhoneState extends State<EditUserPhone> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var errorText = "";
  var isLoading = false;
  var countryName = "";
  var countryFlag = "";
  var countryCode = "";


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
                    Text('Phone Number',
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              margin: EdgeInsets.only(top: 40),
                              inputDecoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search)
                              ),
                            ),
                            useSafeArea: true,
                            onSelect: (Country value) {
                              setState(() {
                                countryName = value.name;
                                countryCode = "+${value.phoneCode}";
                                countryFlag = value.flagEmoji;
                              });
                            },
                          )
                        },
                        child: Container(
                          width: 75,
                          margin: const EdgeInsets.only(top: 18),
                          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: ThemeColor.black.withOpacity(0.6), width: 0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: countryCode == "" ?
                          const Text('') :
                          Row(
                            children: [
                              Text(countryFlag),
                              const SizedBox(width: 5),
                              Text(countryCode,
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 10
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomInput(
                          labelText: 'Phone',
                          inputAction: TextInputAction.done,
                          inputController: phoneController,
                          inputType: TextInputType.phone,
                          icon: Icons.call,
                          inputError: errorText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("By updating your country and number make sure all details are correct. Clients only reach you on the number provided.",
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
