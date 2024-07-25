import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindbox/assest/renk/color.dart';

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Ayakkabı",
      "price": "\₺255",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Ayakkabı",
      "price": "\₺245",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Kıyafet",
      "price": "\₺155",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Kıyafet",
      "price": "\₺275",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Kıyafet",
      "price": "\₺25",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Kıyafet",
      "price": "\₺27",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    },
    {
      "title": "Kıyafet",
      "price": "\₺55",
      "images": "lib/assest/adidas_ayakkabı.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final GridB gridB;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 310,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(
                  0.4,
                  0.4,
                ),
                blurRadius: 5.0,
                spreadRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: AppColors.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  "${gridMap.elementAt(index)['images']}",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${gridMap.elementAt(index)['title']}",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['price']}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          color: AppColors.secondaryColor,
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.heart,
                          ),
                        ),
                        IconButton(
                          color: AppColors.secondaryColor,
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.cart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
