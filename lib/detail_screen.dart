import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'helper_class.dart';
import 'model_class.dart';

class DetailScreen extends StatefulWidget {
  final String type;
  String image;
  String title;
  DetailScreen({required this.type, required this.title, required this.image});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future fetchAnimal;
  @override
  void initState() {
    fetchAnimal = dbh.getAllAnimals(type: widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  const Text(
                    "Animals",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  children: [
                    const Text(
                      "Related for you",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: FutureBuilder(
                        future: fetchAnimal,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  snapshot.data[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.38,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        margin: const EdgeInsets.only(right: 15),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        snapshot.data[index].name,
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            snapshot.data[index].detail,
                                            style:
                                                const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Quick Categories",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.dog),
                            onTap: () {
                              setState(() {
                                fetchAnimal =
                                    dbh.getAllAnimals(type: "MAMMALS");
                                widget.image =
                                    "https://th-thumbnailer.cdn-si-edu.com/a11lI2GJgXuOiJh6TacnnOedIpA=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/two-male-lions-Kenya-631.jpg";
                                widget.title = "Mammals";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.dove),
                            onTap: () {
                              setState(() {
                                fetchAnimal = dbh.getAllAnimals(type: "BIRDS");
                                widget.image =
                                    "https://media.istockphoto.com/photos/portrait-of-two-cute-cuddling-budgies-perched-on-branch-with-blue-as-picture-id1243410279?k=20&m=1243410279&s=612x612&w=0&h=MPBlyJfh7giIlfk7D18WZKaABEORx06GOzbllewOAto=";
                                widget.title = "Birds";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context, icon: FontAwesomeIcons.fish),
                            onTap: () {
                              setState(() {
                                fetchAnimal = dbh.getAllAnimals(type: "FISH");
                                widget.image =
                                    "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjM2NTI5fQ";
                                widget.title = "Fish";
                              });
                            },
                          ),
                          InkWell(
                            child: getCategories(
                                context: context,
                                icon: FontAwesomeIcons.dragon),
                            onTap: () {
                              setState(() {
                                fetchAnimal =
                                    dbh.getAllAnimals(type: "REPTILES");
                                widget.image =
                                    "https://cdn.britannica.com/67/65367-050-0739DCEE/crocodiles-thermoreceptors-Reptiles-changes-body-environment-Information.jpg";
                                widget.title = "Reptiles";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
