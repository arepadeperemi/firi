import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final categoriesList = [
    'Hotels',
    'Shortlets',
    'Popular'
  ];

  int currentSelect = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentSelect = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: currentSelect == index ? Colors.black26 : Colors.transparent,
                        width: 1
                    )
                ),
              ),
              child: Text(
                categoriesList[index],
                style: TextStyle(
                    color: currentSelect == index ? Colors.black54 : Colors.grey,
                    fontWeight: currentSelect == index ? FontWeight.bold : FontWeight.normal,
                    fontSize: 10
                ),
              ),
            ),
          ),
          separatorBuilder: (_, index) => const SizedBox(width: 15),
          itemCount: categoriesList.length
      ),
    );
  }
}
