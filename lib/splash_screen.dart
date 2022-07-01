import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'helper_class.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future fetchAnimal;
  Random random = Random();
  @override
  void initState() {
    super.initState();
    getInitialData();
    int number = random.nextInt(20);
    fetchAnimal = dbh.getAnimalById(id: number);
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    });
  }

  getInitialData() async {
    await dbh.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchAnimal,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(snapshot.data[0].image ??
                    "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/lion-cub-walkingmanoj-shah.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const Text(
                    "Animal Biography",
                    style: TextStyle(
                        color: Colors.white, fontSize: 30, letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Text(
                    "Ready to Watch?",
                    style: TextStyle(
                        color: Colors.white, fontSize: 60, letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: const Text(
                    "Animal biography is a global leader in real life entertainment serving apassionate audience of superfine around the world with content inspire informs anentertains.",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 2),
                  ),
                ),
                const Text(
                  "Start Enjoying",
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, letterSpacing: 2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
