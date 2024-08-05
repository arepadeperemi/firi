import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

import '../../../../api/convert.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {

  ScrollController reviewsController = ScrollController();
  var isFetching = true;

  void scrollViews(){

    reviewsController.addListener(() {

    });
  }

  var data = {
    'request': 'comments'
  };
  List comments = [];

  void userComments() async {
    try {
      var res = await Requests().loginUser(data, "/request/comments");
      res = jsonDecode(res.body);

      if(res['success']){
        isFetching = false;

        setState(() {
          comments = res['data'];
        });
      }
    } catch(e){
      print('Error handled');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userComments();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return isFetching == false ? comments.isEmpty ?
      Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 50),
          height: 100,
            child: const Text('No reviews yet fot this account')
        ): ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const ScrollPhysics(),
        controller: reviewsController,
        itemCount: comments.length,
        itemBuilder: (context, index){
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: (index == comments.length - 1) ? Colors.transparent : ThemeColor.black.withOpacity(0.1),
                        width: 0.5
                    ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(comments[index]['user_id']),
                  const SizedBox(height: 10),
                  Text(comments[index]['comment'],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 12, ),
                      const SizedBox(width: 5),
                      Text(Convert().convertMilliseconds(comments[index]['time_stamp']),
                        style: const TextStyle(
                            fontSize: 8,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  )
                ],
              )
          );
        }
    ) :
    Center(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
