import 'package:flutter/material.dart';

import '../../../core/function/set_notification_badge_number.dart';

class AddNotificationButton extends StatelessWidget {
  AddNotificationButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: MaterialButton(
            onPressed: () {
              setNotificationBadgeNumberIos(12);
              // setNotificationBadgeNumber(12, context);
            },
            color: Colors.red,
            child: Text(
              'add notification',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
