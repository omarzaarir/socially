import 'package:flutter/material.dart';
import 'dart:math' as math;

class Handchecks extends StatefulWidget {
  const Handchecks({super.key});

  @override
  State<Handchecks> createState() => _HandchecksState();
}

class _HandchecksState extends State<Handchecks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Transform.rotate(
                        angle: -math.pi / 4,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Transform.rotate(
                                angle: math.pi / 4,
                                child: Transform.scale(
                                  scale: 2,
                                  child: Image.asset(
                                    "assets/images/nn.jpg",
                                  ),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Poppins",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        "@johndoe",
                        style: TextStyle(
                            color: const Color(0xff4E4E4E),
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Posts",
                                style: TextStyle(
                                    color: Color(0xFF656565),
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                "35",
                                style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: Color(0xFF656565),
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                "1,552",
                                style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Follows",
                                style: TextStyle(
                                    color: Color(0xFF656565),
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                "128",
                                style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SliverPersistentHeader(pinned: true,
                      //   delegate:
                      // ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                leading: SizedBox(),
                toolbarHeight: 0,
                // expandedHeight: 100.0,
                pinned: true,
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car), text: "Car"),
                    Tab(icon: Icon(Icons.directions_transit), text: "Transit"),
                    Tab(icon: Icon(Icons.directions_bike), text: "Bike"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(child: Text("Car Tab")),
              Center(child: Text("Car Tab")),
              Center(child: Text("Car Tab")),
            ],
          ),
        ),
      ),
    );
  }
}
