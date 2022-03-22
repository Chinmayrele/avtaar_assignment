import 'package:avatar/models/user.dart';
import 'package:avatar/providers/user_provider.dart';
import 'package:avatar/screens/data_holder_display.dart';
import 'package:avatar/screens/profile_edit.dart';
import 'package:avatar/widgets/activity_container.dart';
import 'package:avatar/widgets/career_container.dart';
import 'package:avatar/widgets/intro_home.dart';
import 'package:flutter/material.dart';
import 'package:avatar/widgets/color_textstyle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).getDetialUser() as User;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                const Center(
                  widthFactor: 5,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            const IntroHome(),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 26),
              child: Text(
                'Profile (100%)',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: dividerColor,
              thickness: 3,
              endIndent: 26,
              indent: 26,
            ),
            // const SizedBox(height: 10),
            const CareerContainer(),
            const ActivityContainer(),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 4),
              margin: const EdgeInsets.only(left: 16, right: 14, bottom: 15),
              height: 480,
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Background',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  // const SizedBox(height: 1),
                  DataHolderDisplay(text: 'Name', data: userData.name),
                  DataHolderDisplay(text: 'Email', data: userData.email),
                  DataHolderDisplay(
                      text: 'Contact Number', data: userData.contactNo),
                  DataHolderDisplay(text: 'Country', data: userData.country),
                  DataHolderDisplay(text: 'City', data: userData.city),
                  DataHolderDisplay(
                      text: 'What i am currently Doing',
                      data: userData.description),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const ProfileEdit()));
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: TextButton.styleFrom(primary: uploadButtonColor),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: TextButton.styleFrom(primary: headerColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 4),
              margin: const EdgeInsets.only(left: 16, right: 14, bottom: 15),
              height: 42,
              width: 330,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Setting',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}