import 'package:avatar/models/user.dart';
import 'package:avatar/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroHome extends StatelessWidget {
  const IntroHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).getDetialUser() as User;
    return Row(
      children: [
        const SizedBox(width: 26),
        Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: userData.image == null
              ? Image.asset(
                  'assets/images/Group.png',
                  fit: BoxFit.cover,
                )
              : Image.file(
                  userData.image!,
                  fit: BoxFit.cover,
                ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'John Doe',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 9),
            Container(
                margin: const EdgeInsets.only(right: 7),
                height: 43,
                width: 240,
                child: const Text(
                  'I am here to find what aligns eith my interests',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
