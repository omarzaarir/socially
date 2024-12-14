import 'package:gallery/models/chatModel/chatsModel.dart';

class Chatlistcontroller {
  Set<Chat> chatslist = <Chat>{};

  addchat(Chat newChat) {
    chatslist.add(newChat);
  }

  AutoFillForTesting() {
    chatslist.add(
      Chat(
        personid: 1,
        personName: "Omar Zaarir",
        lastMessege: "wellcom bro",
        imageUrl:
            "https://images.pexels.com/photos/2120084/pexels-photo-2120084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        chatId: 0,
        messages: List.empty(),
      ),
    );
    chatslist.add(
      Chat(
        personid: 1,
        personName: "Samer Kareem",
        lastMessege: "wellcom bro",
        imageUrl:
            "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        chatId: 0,
        messages: List.empty(),
      ),
    );
    chatslist.add(
      Chat(
        personid: 1,
        personName: "Mo Salah",
        lastMessege: "my leg is broken",
        imageUrl:
            "https://images.pexels.com/photos/11061168/pexels-photo-11061168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        chatId: 0,
        messages: List.empty(),
      ),
    );
    chatslist.add(
      Chat(
        personid: 1,
        personName: "Samera Saliha",
        lastMessege: "can we begin later?",
        imageUrl:
            "https://images.pexels.com/photos/15953861/pexels-photo-15953861/free-photo-of-woman-in-retro-dress-and-knit-scarf.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        chatId: 0,
        messages: List.empty(),
      ),
    );
  }
}
