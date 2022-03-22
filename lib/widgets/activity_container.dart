import 'package:avatar/widgets/color_textstyle.dart';
import 'package:flutter/material.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      margin: const EdgeInsets.only(left: 16, right: 14, top: 10, bottom: 15),
      height: 130,
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text(
            'My Activity',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 81,
                width: 150,
                decoration: BoxDecoration(
                    color: containerColorOrange,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: Text('2',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                    SizedBox(
                        height: 23,
                        width: 78,
                        child: Text(
                          'Hour(s) spent on Career learning',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ))
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 81,
                width: 148,
                decoration: BoxDecoration(
                    color: containerColorRed,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: Text('6',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                    ),
                    SizedBox(
                        height: 12,
                        width: 86,
                        child: Text(
                          'Career(s) Explored',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
