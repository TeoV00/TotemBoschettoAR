import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeatilsHeader extends StatelessWidget {
  const DeatilsHeader({
    super.key,
    required this.nickname,
  });

  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "icons/stake.svg",
          height: 65,
        ),
        Text(
          nickname,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        SvgPicture.asset(
          "icons/stake.svg",
          height: 65,
        )
      ],
    );
  }
}
