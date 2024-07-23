import 'package:country_picker/country_picker.dart';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/shared/edit_craft_man_address.dart';
import 'package:craftmani/views/app_home/screens/shared/edit_user_phone.dart';
import 'package:craftmani/views/app_home/screens/shared/edit_user_name.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

class CraftManEditProfile extends StatefulWidget {
  const CraftManEditProfile({Key? key}) : super(key: key);

  @override
  State<CraftManEditProfile> createState() => _CraftManEditProfileState();
}

class _CraftManEditProfileState extends State<CraftManEditProfile> {

  TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/craftman_hands.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(ThemeColor.black.withOpacity(0.5), BlendMode.darken)
                ),
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PreviousPage(icon: Icons.arrow_back_ios_rounded, size: 30),
                    SizedBox(width: 10),
                    Text('Edit Profile',
                      style: TextStyle(
                        color: ThemeColor.white,
                        fontSize: 16,
                        fontFamily: 'Poppins'
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.primary,
                            image: DecorationImage(
                              image: AssetImage('assets/images/peremi_avatar.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(ThemeColor.black.withOpacity(0.5), BlendMode.darken)
                            )
                        ),
                        child: Image(
                          image: AssetImage('assets/images/007_043_edit_image_painting_photo_picture_gallery_album-1024-741502609'),
                          color: ThemeColor.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Icon(Icons.edit_note_outlined),
                              TextField(
                                controller: descriptionController,
                                onChanged: (value){
                                  debugPrint(value);
                                },
                                textInputAction: TextInputAction.done,
                                maxLines: 3,
                                maxLength: 100,
                                style: TextStyle(
                                  fontSize: 12
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                                  hintText: 'Add description of your skills to allow clients even find you faster',
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                Navigator.push(context, Transition(child:EditUserName(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
              },
              child: SettingsMenuItem(
                text: 'Arepade Peremi',
                description: "Here you change your full name. It doesn't necessarily need to be your official name. But it's good to have your name in sync.",
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, Transition(child:EditUserPhone(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
              },
              child: SettingsMenuItem(
                text: '+234 9067181502',
                description: 'Change your phone number. Make sure it is correct. Clients can only reach you on here.',
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, Transition(child: const EditCraftManAddress(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
              },
              child: const SettingsMenuItem(
                text: 'No. 767 Crecent close, Akesan, Lagos',
                description: "Edit your offline address. This address allows clients to find you when you're not live",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
