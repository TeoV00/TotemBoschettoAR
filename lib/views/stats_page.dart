import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/stats_circle.dart';

const statIconPath = "/icons/statistics/";

var stat = <StatsCircle>[
  StatsCircle(
    color: const Color.fromRGBO(73, 166, 31, 1),
    label: "ALBERI PIANTATI",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}forest.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
  StatsCircle(
    color: const Color.fromRGBO(234, 156, 98, 1),
    label: "PROGETTI COINVOLTI",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}project.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
  StatsCircle(
    color: const Color.fromRGBO(181, 206, 255, 1),
    label: "FOGLI A4 RISPARMIATI",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}paper.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
  StatsCircle(
    color: const Color.fromRGBO(105, 93, 105, 1),
    label: "CO2 EVITATA",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}co2.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
  StatsCircle(
    color: const Color.fromRGBO(254, 210, 164, 1),
    label: "CONSAPEVOLEZZA",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}AWARENESS.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
  StatsCircle(
    color: const Color.fromARGB(255, 253, 218, 60),
    label: "ELETTRICITà RISPARMIAT ssssssssA",
    description: "lore ipsoidninic sdnkn csdlak ",
    icon: Image.asset("${statIconPath}paper.png", height: iconSize),
    size: 230,
    strokeWidth: 40,
  ),
];

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 60,
      crossAxisSpacing: 60,
      children: [...stat],
    );
  }
}
