import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model_class.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Animal Biography",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "Choose Category",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView(
                children: [
                  getContainer(
                    context: context,
                    title: "Mammals",
                    image:
                        "https://media.istockphoto.com/photos/two-male-african-lions-with-full-manes-picture-id482537579?k=20&m=482537579&s=612x612&w=0&h=mVKInnVnGEvni2v5ZEZCGegwuV2vesxY3pmFqNEFQ0I=",
                    total: "5",
                    icon: FontAwesomeIcons.dog,
                    type: "MAMMALS",
                  ),
                  getContainer(
                    context: context,
                    title: "Birds",
                    image:
                        "https://media.istockphoto.com/photos/love-talks-parrots-whispering-picture-id168481690?k=20&m=168481690&s=612x612&w=0&h=KhUEeUNCT3XG-CUKlH4RvFlisu-wPr2_OtsCWWxcQic=",
                    total: "5",
                    icon: FontAwesomeIcons.dove,
                    type: "BIRDS",
                  ),
                  getContainer(
                    context: context,
                    title: "Fish",
                    image:
                        "https://cdn.pixabay.com/photo/2021/01/14/20/32/fish-5917864__340.jpg",
                    total: "5",
                    icon: FontAwesomeIcons.fish,
                    type: "FISH",
                  ),
                  getContainer(
                    context: context,
                    title: "Reptiles",
                    image:
                        "https://media.istockphoto.com/photos/pogona-lizard-sitting-on-a-wooden-surface-in-a-forest-picture-id171152147?b=1&k=20&m=171152147&s=170667a&w=0&h=O5ynNDWrBN5g543e3L0Vb0Xgb1GxCFu7P1BgXtu0Yrc=",
                    total: "5",
                    icon: FontAwesomeIcons.staffSnake,
                    type: "REPTILES",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
