import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gallery/haptics/haptics.dart';
import 'package:gallery/styles/styles.dart';
import 'package:gallery/view/commons.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late PageController pageController = PageController();
  int pagenumbe = 0;

  final List<String> you_will_find = [
    "Home Screen",
    "Profile Page",
    "Conversations",
    "Messaging",
  ];
  void _handlePageChanged(value) {
    AppHaptics.lightImpact();
    setState(() {
      pagenumbe = value;
    });
  }

  final bg = Transform.translate(
    offset: Offset(-160, 180),
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
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    ),
  );

  List<Widget> _text() {
    return pagenumbe == 0
        ? [
            text_16("Welcome to"),
            text_39("Socially")
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(delay: 1000.ms, duration: 1000.ms),
          ]
        : [
            text_39("Hello!")
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(delay: 600.ms, duration: 600.ms),
            text_16("you will find:"),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bg,
          Positioned(
            bottom: 10,
            left: 10,
            child: text_16("Swipe left to see more"),
          ),
          PageView(
            controller: pageController,
            onPageChanged: _handlePageChanged,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/Frame.png",
                  alignment: Alignment.center,
                ),
              ),
              Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: you_will_find.length,
                  itemBuilder: (context, index) {
                    return Text(
                        textAlign: TextAlign.center,
                        you_will_find[index],
                        style: text_16("").style);
                  },
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .shimmer(delay: 4000.ms, duration: 1800.ms),
              )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._text(),
                SizedBox(
                  height: 360,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 90,
              left: 30,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect:
                    ExpandingDotsEffect(activeDotColor: AppStyle.colors.black),
              )),
          Positioned(
            bottom: -30,
            right: -30,
            child: Transform.rotate(
              angle: 45,
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: AppStyle.colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Transform.rotate(
                  angle: -45,
                  child: TextButton(
                    onPressed: () {
                      context.go("/home");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SKIP",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
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
