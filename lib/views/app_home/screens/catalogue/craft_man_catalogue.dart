import 'package:craftmani/views/app_home/screens/catalogue/upload_catalogue.dart';
import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

import 'catalogue.dart';


class CraftManCatalogueScreen extends StatefulWidget {
  const CraftManCatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CraftManCatalogueScreen> createState() => _CraftManCatalogueScreenState();
}

class _CraftManCatalogueScreenState extends State<CraftManCatalogueScreen> {

  List<String> tabs = ['Catalogue', 'Upload'];
  List screens = [const CatalogueScreen(), const UploadCatalogue()];
  int currentTab = 0;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: ThemeColor.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) => Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              border: currentTab == index ? const Border(
                                  bottom: BorderSide(
                                      color: Colors.white,
                                      width: 4
                                  )
                              ) : const Border()
                          ),
                          child: GestureDetector(
                            onTap: () => {
                              setState((){
                                currentTab = index;
                              })
                            },
                            child: Text(tabs[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: currentTab == index ? Colors.white60 : Colors.white
                              ),
                            ),
                          ),
                        ),
                      itemCount: 2,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: screens[currentTab],
            )

          ],
        )],
    );
  }
}
