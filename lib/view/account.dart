import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, -300),
            child: Transform.rotate(
              angle: math.pi / 4,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 2,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffE1F6F4),
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffE1F6F4),
                          ),
                          borderRadius: BorderRadius.circular(60)),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xffE1F6F4),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Transform.translate(
          //   offset: Offset(0, -270),
          //   child: Transform.rotate(
          //     angle: math.pi / 4,
          //     alignment: Alignment.center,
          //     child: Transform.scale(
          //       scale: 2,
          //       child: Center(
          //         child: Container(
          //           height: 300,
          //           width: 300,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: Color(0xffE1F6F4)),
          //               borderRadius: BorderRadius.circular(60)),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(0, -310),
          //   child: Transform.rotate(
          //     angle: math.pi / 4,
          //     alignment: Alignment.center,
          //     child: Transform.scale(
          //       scale: 2,
          //       child: Center(
          //         child: Container(
          //           height: 300,
          //           width: 300,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: Color(0xffE1F6F4)),
          //               borderRadius: BorderRadius.circular(60)),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SafeArea(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: TabBarDelegate(
                        TabBar(
                          dividerColor: Colors.transparent,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.image_outlined),
                            ),
                            Tab(
                              icon: Icon(Icons.save),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: ColoredBox(
                  color: Colors.white,
                  // child: MasonryGridViewWidget(),
                  child: TabBarView(
                    children: [
                      Center(
                          child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => Text("data"),
                      )),
                      Center(child: MasonryGridViewWidget()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white60, // Background color for the TabBar
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class MasonryGridViewWidget extends StatelessWidget {
  const MasonryGridViewWidget({super.key});

  final List<String> networkImage = const [
    "https://images.pexels.com/photos/27462202/pexels-photo-27462202/free-photo-of-the-top-of-a-building-with-statues-on-it.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/15953861/pexels-photo-15953861/free-photo-of-woman-in-retro-dress-and-knit-scarf.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/29299714/pexels-photo-29299714/free-photo-of-autumn-leaves-in-a-sunlit-forest-setting.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/29429907/pexels-photo-29429907/free-photo-of-close-up-of-pelican-with-vibrant-bill-by-water.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/29510214/pexels-photo-29510214/free-photo-of-dramatic-night-lightning-over-urban-landscape.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/29369234/pexels-photo-29369234/free-photo-of-scenic-mountain-view-with-power-lines.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: networkImage.length,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(networkImage[index]))
            // Tile(
            //   index: index,
            //   extent: (index % 5 + 1) * 100,
            // )
            ;
      },
    );
  }
}
