import 'package:flutter/material.dart';

import '../widgets/color_textstyle.dart';

class DataHolderDisplay extends StatelessWidget {
  final String text;
  final dynamic data;
  const DataHolderDisplay({
    Key? key,
    required this.text,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: headerStyle,
        ),
        const SizedBox(height: 6),
        Text(data, style: displayDataStyle),
        const Divider(
          color: divideHeaderColor,
          thickness: 1,
          endIndent: 40,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}