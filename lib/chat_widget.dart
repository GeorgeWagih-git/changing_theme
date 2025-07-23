import 'package:flutter/material.dart';
import 'package:project/chat_class.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chatdata});
  final Chat chatdata;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: 32.5,
          foregroundImage: NetworkImage(
            chatdata.chaturl ??
                'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-1024.png',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatdata.title ?? '',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                chatdata.subtitle ?? 'Empty',
                maxLines: 1,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),

        Text(chatdata.sendTime ?? '0:00 AM'),
      ],
    );
  }
}
