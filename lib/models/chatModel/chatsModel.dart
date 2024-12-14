import 'package:gallery/models/chatModel/messageModel.dart';

class Chat {
  int personid;
  String personName;
  String lastMessege;
  String imageUrl;
  int chatId;
  List<Message> messages;
  Chat(
      {required this.personid,
      required this.personName,
      required this.lastMessege,
      required this.imageUrl,
      required this.chatId,
      required this.messages});
}
