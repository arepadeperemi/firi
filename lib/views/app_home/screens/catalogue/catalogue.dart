import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert';


class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {

  late List images = [];
  var userId = "";

  ScrollController scrollMedia = ScrollController();
  ScrollController _ScrollViewControler = ScrollController();

  var url = "https://winexexpress.com/wp-content/uploads/2016/01/";

  void userCatalogue() async {
    try {
      dynamic user_id = await SessionManager().get('user_token');
      userId = user_id;
      var data = {
        'request': 'getCatalogue',
        'user_id': await SessionManager().get('user_token')
      };
      var res = await Requests().loginUser(data, "/request/getCatalogue");
      res = jsonDecode(res.body);

      if(res['success']){
        //isFetching = false;

        setState(() {
          images = res['data'];
        });
      }
    } catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCatalogue();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: images.isEmpty ?
      Container(
          alignment: Alignment.center,
          height: 100,
          child: const Text('No Images in catalog', textAlign: TextAlign.center)
      ) :
      MasonryGridView.builder(
          itemCount: images.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemBuilder: (context, index) => Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(url + images[index])
              ),
            ),
          )
      ),
    );
  }
}
