import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:intl/intl.dart';

class MessageHolder extends StatelessWidget {
  const MessageHolder({
    super.key,
    required this.sentMessage,
    required this.receivedMessage,
    required this.sentTime,
    required this.receivedTime,
  });

  final String sentMessage;
  final String receivedMessage;
  final String sentTime;
  final String receivedTime;

  @override
  Widget build(BuildContext context) {
    DateTime sentDate = DateFormat('dd.MM.yyyy HH:mm:ss').parse(sentTime);
    DateTime receivedDate =
        DateFormat('dd.MM.yyyy HH:mm:ss').parse(receivedTime);

    String sentHours = DateFormat('HH:mm').format(sentDate);
    String receivedHours = DateFormat('HH:mm').format(receivedDate);
    return Column(
      children: [
        Message(
          type: BubbleType.sendBubble,
          message: sentMessage,
          time: sentHours,
        ),
        Message(
          type: BubbleType.receiverBubble,
          message: receivedMessage,
          time: receivedHours,
        ),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.type,
    required this.message,
    required this.time,
  });

  final BubbleType type;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    final bool isSender = type == BubbleType.sendBubble;
    return ChatBubble(
      clipper: ChatBubbleClipper6(type: type),
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      margin: const EdgeInsets.only(top: 20),
      backGroundColor: isSender ? Colors.blue : const Color(0xffE7E7ED),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: isSender ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 10,
                color: isSender ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
