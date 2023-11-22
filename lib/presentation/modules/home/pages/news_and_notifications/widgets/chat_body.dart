import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/cubit/notifications_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/widgets/message_holder.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/widgets/message_sender_field.dart';

import '../../../../../../domain/models/news_and_notifications/message_model.dart';
import '../../../../../../domain/models/news_and_notifications/message_sent_model.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        final messages = state.data.messages;

        if (messages == null) {
          context.read<NotificationsCubit>().getMessages();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final Map<String, List<MessageModel>> messagesByDate = {};

        for (var message in messages) {
          if (messagesByDate.containsKey(message.date)) {
            messagesByDate[message.date]!.add(message);
          } else {
            messagesByDate[message.date] = [message];
          }
        }

        List<String> sortedDates = messagesByDate.keys.toList()..sort();

        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Padding(
              padding: EdgeInsets.all(context.dimens.paddingMedium),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: sortedDates.length,
                      itemBuilder: (context, index) {
                        String date = sortedDates[index];
                        DateTime dateOnly = DateFormat('dd.MM.yyyy HH:mm:ss').parse(date);
                        String time = DateFormat('dd.MM.yyyy').format(dateOnly);

                        List<MessageModel> messagesForDate = messagesByDate[date]!;
                        return Column(
                          children: [
                            Text(
                              time,
                            ),
                            Column(
                              children: [
                                ...messagesForDate.map((message) {
                                  return MessageHolder(
                                      sentMessage: message.text,
                                      receivedMessage: message.feedback_text,
                                      sentTime: message.date,
                                      receivedTime: message.feedback_date
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                 MessageSenderField(
                      onSend: () => context
                          .read<NotificationsCubit>()
                          .sendMessage(MessageSentModel(
                            id: 1,
                            sender_id: "1234",
                            date: DateTime.now().toString(),
                            text: _controller.text,
                          )),
                    )
              ]),
            ));
      },
    );
  }
}
