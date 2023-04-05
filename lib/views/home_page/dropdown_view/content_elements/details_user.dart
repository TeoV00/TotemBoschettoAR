import 'package:flutter/material.dart';

const labelValStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

class UserDetails extends StatelessWidget {
  final int treesCount;
  final double co2;
  final int badgeCount;
  const UserDetails(
      {super.key,
      required this.treesCount,
      required this.co2,
      required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getLabelValue("Alberi scoperti", treesCount),
          _getLabelValue("Co2", co2),
          _getLabelValue("elettricità", co2),
          _getLabelValue("altro", co2),
          _getLabelValue("N. Badge", badgeCount),
        ],
      ),
    );
  }

  Row _getLabelValue(String label, value) {
    return Row(
      children: [
        Text("$label: ", style: labelValStyle),
        Text("$value", style: labelValStyle),
      ],
    );
  }
}
