import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/chat_class.dart';
import 'package:project/chat_widget.dart';
import 'package:project/messenger_data.dart';
import 'package:project/theme_bloc.dart';
import 'package:project/theme_events.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Chat> chatList = chats;
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chats', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.purple,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade600,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list, color: Colors.white),
                ),
              ),
            ),
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade600,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Switch(
                  value: state,
                  onChanged: (value) {
                    BlocProvider.of<ThemeBloc>(
                      context,
                    ).add(ChangeTheme(isLight: value));
                    print('the new value from appBar = $value');
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatWidget(chatdata: chatList[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
