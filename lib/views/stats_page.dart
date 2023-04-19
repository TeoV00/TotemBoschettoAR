import 'package:flutter/material.dart';
import 'package:totem_boschetto/dataProvider/data_manager.dart';
import 'package:totem_boschetto/views/statistic_widgets/statistics_constant.dart';
import 'package:totem_boschetto/views/statistic_widgets/stats_circle.dart';

const statIconPath = "/icons/statistics/";

class StatisticPage extends StatelessWidget {
  final DataManager dataManager;
  const StatisticPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    var statInfo = <StatsCircle>[
      StatsCircle(
        color: treeColor,
        label: treeLabel,
        description: treeDescr,
        icon: treeIcon,
        value: dataManager.getPlantedTree(),
      ),
      StatsCircle(
        color: projColor,
        label: projLabel,
        description: projDescr,
        icon: projIcon,
        value: dataManager.getProjectInvolved(),
      ),
      StatsCircle(
        color: co2Color,
        label: co2Label,
        description: co2Descr,
        icon: co2Icon,
        value: dataManager.getAvoidedCo2(),
      ),
      StatsCircle(
        color: paperColor,
        label: paperLabel,
        description: paperDescr,
        icon: paperIcon,
        value: dataManager.getSavedPaper(),
      ),
      StatsCircle(
        color: awarenessColor,
        label: awarenessLabel,
        description: awarenessDescr,
        icon: awarenessIcon,
        value: dataManager.getAwareness(),
      ),
    ];

    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 60,
        crossAxisSpacing: 60,
        children: statInfo);
  }
}
