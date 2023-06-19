import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem_boschetto/data_manager.dart';
import 'package:totem_boschetto/views/stats_page/statistics_constant.dart';
import 'package:totem_boschetto/views/stats_page/stats_circle.dart';

const statIconPath = "/icons/statistics/";

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, dataManager, child) =>
          FutureBuilder<Map<StatId, String>>(
        future: dataManager.getStatistics(),
        builder: (context, snapshot) {
          return StatsGridView(statsData: snapshot.data);
        },
      ),
    );
  }
}

class StatsGridView extends StatelessWidget {
  final Map<StatId, String>? statsData;

  const StatsGridView({super.key, required this.statsData});

  @override
  Widget build(BuildContext context) {
    var statInfo = <StatsCircle>[
      StatsCircle(
        color: treeColor,
        label: treeLabel,
        description: treeDescr,
        icon: treeIcon,
        value: _getStatValue(statId: StatId.tree),
      ),
      StatsCircle(
        color: projColor,
        label: projLabel,
        description: projDescr,
        icon: projIcon,
        value: _getStatValue(statId: StatId.proj),
      ),
      StatsCircle(
        color: co2Color,
        label: co2Label,
        description: co2Descr,
        icon: co2Icon,
        value: _getStatValue(statId: StatId.co2),
      ),
      StatsCircle(
        color: paperColor,
        label: paperLabel,
        description: paperDescr,
        icon: paperIcon,
        value: _getStatValue(statId: StatId.paper),
      ),
      StatsCircle(
        color: ePowerColor,
        label: ePowerLabel,
        description: ePowerDescr,
        icon: ePowerIcon,
        value: _getStatValue(statId: StatId.ePower),
      ),
      StatsCircle(
        color: fuelColor,
        label: fuelLabel,
        description: fuelDescr,
        icon: fuelIcon,
        value: _getStatValue(statId: StatId.fuel),
      ),
    ];

    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 60,
        crossAxisSpacing: 60,
        children: statInfo);
  }

  String _getStatValue({required StatId statId}) {
    return statsData != null
        ? statsData![statId] ?? "Dato non disponibile"
        : "Caricamento...";
  }
}
