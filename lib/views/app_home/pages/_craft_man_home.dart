import 'package:craftmani/views/app_home/pages/craft_man_edit_profile.dart';
import 'package:craftmani/views/app_home/screens/catalogue/catalogue.dart';
import 'package:craftmani/views/app_home/screens/craft_men/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:craftmani/exports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:transition/transition.dart';

import '../../authenticate/login.dart';


class CraftManHome extends StatefulWidget {
  const CraftManHome({Key? key}) : super(key: key);

  @override
  State<CraftManHome> createState() => _CraftManHomeState();
}

class _CraftManHomeState extends State<CraftManHome> {


  bool toggleSelect = false;
  int currentSelect = 0;

  List tabTitle = [Icons.comment, Icons.perm_media_rounded];
  List tabContent = [ReviewsScreen(), const CatalogueScreen()];

  closePage() async {
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return closePage();
      },
      child: Scaffold(
        backgroundColor: ThemeColor.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              pinned: true,
              backgroundColor: ThemeColor.primary,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          CustomNotification(height: 300).notificationModal(
                              context,
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    height: 156,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: ThemeColor.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      children: [
                                        MenuList(
                                            title: 'live Location',
                                            widget: FlutterSwitch(
                                              value: toggleSelect,
                                              width: 50,
                                              height: 30,
                                              onToggle: (bool value) {
                                                setState(() {
                                                  if(value == false){
                                                    toggleSelect = true;
                                                  } else {
                                                    toggleSelect = false;
                                                  }
                                                });
                                              },
                                            )
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, Transition(child: const CraftManEditProfile(),
                                                transitionEffect: TransitionEffect.RIGHT_TO_LEFT)
                                            );
                                          },
                                          child: MenuList(
                                              title: 'Edit Profile',
                                              widget: Icon(Icons.arrow_forward_ios_outlined)
                                          ),
                                        ),
                                        MenuList(
                                            title: 'About',
                                            widget: Icon(Icons.arrow_forward_ios_outlined),
                                            bottomBorder: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      padding:const  EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      width: double.maxFinite,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ThemeColor.white,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Text('Close',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )
                          );
                        });
                      },
                      child: const AppIcon(icon: Icons.menu)
                  ),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          CustomNotification(height: MediaQuery.of(context).size.height).notificationModal(
                              context,
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    height: MediaQuery.of(context).size.height - 470,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: ThemeColor.white,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      padding:const  EdgeInsets.all(10),
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      width: double.maxFinite,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Text('Close',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              )
                          );
                        });
                      },
                      child: const AppIcon(icon: Icons.notifications, alert: true)
                  )
                ],
              ),
              automaticallyImplyLeading: false,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/craftman_hands.jpg',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                  ),
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ThemeColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ThemeColor.black.withOpacity(0.2),
                          width: 0.3
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.primary.withOpacity(0.5)
                          ),
                          child: const CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: ThemeColor.primary,
                            backgroundImage: AssetImage('assets/images/peremi_avatar.jpg')
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 16,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  updateOnDrag: false,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text('Arepade Peremi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins'
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.verified_user, color: ThemeColor.primary, size: 13,)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.work, size: 10, color: ThemeColor.black.withOpacity(0.7),),
                                    const SizedBox(width: 5),
                                    const Text('Programmer',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Poppins'
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on_rounded, size: 13, color: ThemeColor.black.withOpacity(0.7),),
                                    const SizedBox(width: 5),
                                    const Expanded(
                                      flex: 10,
                                      child: Text('No 1665, Crecent, Lagos ',
                                        style: TextStyle(
                                          fontSize: 10,
                                            fontFamily: 'Poppins'
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(tabTitle.length, (index){
                        return Container(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                currentSelect = index;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(bottom: 5),
                              /*decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: index == currentSelect ? ThemeColor.black.withOpacity(0.5) : Colors.transparent,
                                          width: 1
                                      )
                                  )
                              ),*/
                              child: Icon(tabTitle[index],
                                  color: index == currentSelect ? ThemeColor.black : ThemeColor.black.withAlpha(70)
                              ),
                            ),
                          )
                        );
                      })
                    ),
                  ),
                  tabContent[currentSelect]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
