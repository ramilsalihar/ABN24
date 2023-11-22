import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/cubit/notifications_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/widgets/news_card.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationState>(
      builder: (context, state) {
        final news = state.data.news;

        if (news == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (news.isEmpty) {
          return const Center(
            child: Text('Новостей нет'),
          );
        } else {
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) => NewsCard(
              text: news[index].text,
              date: news[index].date,
              header: news[index].header,
            ),
          );
        }
      },
    );
  }
}
