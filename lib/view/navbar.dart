import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flex(
          // spacing: 10,
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            IconButton(
                onPressed: () {
                  context.go("/home");
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  context.go("/home/chat");
                },
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                )),
            SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  context.go("/home/Handchecks");
                },
                icon: Icon(
                  Icons.handshake,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  context.go("/home/Account");
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ))
          ],
        )
      ],
    );
  }
}
