import 'package:flutter/material.dart';

class CareerContainer extends StatelessWidget {
  const CareerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 5),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
      height: 59,
      width: 329,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          'Career Clarity',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(height: 5),
        Text(
          'I have a general Idea',
          style: TextStyle(color: Colors.black),
        ),
      ]),
    );
  }
}
