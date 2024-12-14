import 'package:flutter/material.dart';
import 'package:gallery/models/Home/Postsmodel.dart';

class Homepostcontroller {
  Set<Postsmodel> posts = <Postsmodel>{};

  AutoFillForTesting() {
    posts.add(
      Postsmodel(
        comentnumber: 10,
        imageUrl:
            "https://images.pexels.com/photos/29688165/pexels-photo-29688165/free-photo-of-young-girl-in-traditional-kazakh-attire-in-talgar.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        likednumber: 20,
        personName: "Omar Zaarir",
        personalimageurl:
            "https://images.pexels.com/photos/2120084/pexels-photo-2120084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        positiveed: 30,
        shareerId: 10,
        timepost: TimeOfDay(hour: 12, minute: 30),
      ),
    );
    posts.add(
      Postsmodel(
        comentnumber: 1,
        imageUrl:
            "https://images.pexels.com/photos/29743804/pexels-photo-29743804/free-photo-of-ortakoy-mosque-beside-the-bosphorus-bridge-in-istanbul.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        likednumber: 20,
        personName: "Samer Kareem",
        personalimageurl:
            "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        positiveed: 3,
        shareerId: 0,
        timepost: TimeOfDay(hour: 12, minute: 30),
      ),
    );
    posts.add(
      Postsmodel(
        comentnumber: 10,
        imageUrl:
            "https://images.pexels.com/photos/17994286/pexels-photo-17994286/free-photo-of-hummingbird-moth.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        likednumber: 20,
        personName: "Mo salah",
        personalimageurl:
            "https://images.pexels.com/photos/11061168/pexels-photo-11061168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        positiveed: 30,
        shareerId: 10,
        timepost: TimeOfDay(hour: 12, minute: 30),
      ),
    );
  }
}
