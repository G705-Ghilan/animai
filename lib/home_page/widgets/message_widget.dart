import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.msg, required this.isUser});
  final String msg;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUser ? null : Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/${isUser ? 'user' : 'luffy'}.jpg",
              width: 50,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(msg)),
        ],
      ),
    );
  }
}
