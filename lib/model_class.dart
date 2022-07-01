import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'detail_screen.dart';

InkWell getContainer({
  required BuildContext context,
  required String title,
  required String image,
  required String total,
  required IconData icon,
  required String type,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return DetailScreen(
              type: type,
              title: title,
              image: image,
            );
          },
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              const Text(
                "Animals",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                color: Colors.white,
              ),
              Text(
                total,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Container getCategories(
    {required BuildContext context, required IconData icon}) {
  return Container(
    child: FaIcon(
      icon,
      size: 70,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
        color: const Color(0xffECD1B3).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15)),
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height * 0.025,
    width: MediaQuery.of(context).size.width * 0.35,
    margin: const EdgeInsets.only(right: 30),
  );
}

class Animal {
  int? id;
  final String type;
  final String name;
  final String detail;
  final String image;
  Animal({
    this.id,
    required this.type,
    required this.name,
    required this.image,
    required this.detail,
  });
  static Animal fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map["id"],
      type: map["type"],
      name: map["name"],
      image: map["image"],
      detail: map["detail"],
    );
  }
}
