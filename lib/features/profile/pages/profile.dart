import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              CircleAvatar(
                radius: context.dynamicHeight(0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
