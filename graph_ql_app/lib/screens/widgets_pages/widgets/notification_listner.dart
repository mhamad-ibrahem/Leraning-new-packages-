import 'package:flutter/material.dart';

class NotificationListenerWidget extends StatelessWidget {
  const NotificationListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
              } else if (notification is ScrollUpdateNotification) {
              } else if (notification is ScrollEndNotification) {}
              return false;
            },
            child: ListView(),
          )
        ],
      ),
    );
  }
}
