import 'package:flutter/material.dart';

import 'package:totem_boschetto/dataProvider/data_manager.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/views/chart_page/chart.dart';

class UserChartView extends StatelessWidget {
  final DataManager dataManager;
  const UserChartView({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Classifica Top 10",
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          FutureBuilder<List<SharedData?>>(
            future: dataManager.getTop10User(),
            builder: (context, snapshot) {
              var data = snapshot.hasData
                  ? snapshot.data!
                  : List<SharedData?>.filled(10, null);

              return Chart(data: data);
            },
          ),
        ],
      ),
    );
  }
}
