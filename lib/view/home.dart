// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gallery/controller/Homecontroller/HomePostcontroller.dart';
import 'package:gallery/models/Home/Postsmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scroller = ScrollController()
    ..addListener(_handleScrollChanged);
  final _scrollPos = ValueNotifier(0.0);
  void _handleScrollChanged() {
    _scrollPos.value = _scroller.position.pixels;
  }

  Homepostcontroller homepostcontroller = Homepostcontroller();

  final bg = Transform.translate(
    offset: Offset(-350, 100),
    child: Transform.rotate(
      angle: 45,
      alignment: Alignment.center,
      child: Transform.scale(
        scale: 2.6,
        child: Container(
          height: 300,
          width: 180,
          decoration: BoxDecoration(
              color: Color(0xffE1F6F4),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    homepostcontroller.AutoFillForTesting();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            bg,
            CustomScrollView(
              controller: _scroller,
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 70),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Feed',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 39),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, bottom: 20, top: 20),
                    child: SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 30,
                              ),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return SizedBox(
                                height: 56,
                                width: 56,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: const RadialGradient(
                                        focal: Alignment(0.9, -0.9),
                                        radius: 1,
                                        colors: [
                                          Color(0xFFFFE1E0),
                                          Color(0xFFE1F6F4),
                                        ],
                                      )),
                                  child: const Icon(Icons.add),
                                ),
                              );
                            }
                            return CircleAvatar(
                              backgroundImage: NetworkImage(homepostcontroller
                                  .posts
                                  .elementAt(
                                      index % homepostcontroller.posts.length)
                                  .personalimageurl),
                              radius: 28,
                            );
                          }),
                    ),
                  ),
                ),
                SliverList.builder(
                  itemCount: homepostcontroller.posts.length,
                  itemBuilder: (context, index) => CardPhoto(
                    post: homepostcontroller.posts.elementAt(index),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 1000),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AnimatedBuilder(
                animation: _scroller,
                builder: (context, child) => AnimatedOpacity(
                  opacity: _scrollPos.value > 50 ? 0 : 1,
                  duration: const Duration(milliseconds: 400),
                  child: child,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Socially',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(),
                        )
                        .shimmer(delay: 8000.ms, duration: 1000.ms),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
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

class CardPhoto extends StatelessWidget {
  const CardPhoto({super.key, required this.post});
  final Postsmodel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(post.imageUrl)),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 122, 141, 139),
      ),
      margin: const EdgeInsets.all(10.0),
      height: 400,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Blurbutton(
                      text: "${post.likednumber}",
                      onPress: () {},
                      icon: Icons.handshake),
                  Blurbutton(
                      text: "${post.comentnumber}",
                      onPress: () {},
                      icon: Icons.chat_bubble_outline),
                  Blurbutton(
                      text: "${post.positiveed}",
                      onPress: () {},
                      icon: Icons.radio_button_checked)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    // height: 100,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(post.personalimageurl)),
                      title: Text(
                        post.personName,
                        style: TextStyle(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  offset: Offset(0, 1),
                                  blurRadius: 10)
                            ],
                            fontFamily: "Poppins",
                            fontSize: 12.8),
                      ),
                      subtitle: Text(
                        "${post.timepost.hour}:${post.timepost.minute} pm",
                        style: TextStyle(
                            color: const Color.fromARGB(141, 255, 255, 255),
                            shadows: [
                              Shadow(
                                  color: const Color.fromARGB(150, 0, 0, 0),
                                  offset: Offset(0, 1),
                                  blurRadius: 20)
                            ],
                            fontFamily: "Poppins",
                            fontSize: 12.8),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Blurbutton extends StatelessWidget {
  const Blurbutton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.icon});
  final String text;
  final IconData icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(103, 229, 229, 229),
      ),
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontFamily: "Poppins", fontSize: 12.8),
            ),
          ],
        ),
      ),
    );
  }
}
