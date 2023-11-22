import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class MessageSenderField extends StatefulWidget {
  const MessageSenderField({super.key, required this.onSend});

  final VoidCallback onSend;

  @override
  State<MessageSenderField> createState() => _MessageSenderFieldState();
}

class _MessageSenderFieldState extends State<MessageSenderField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.dimens.paddingSmall),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Type a message',
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_rounded, color: Colors.blueAccent,),
            onPressed: widget.onSend,
          ),
        ),
        controller: _controller,
      ),
    );
  }
}
