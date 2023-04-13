import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:totem_boschetto/dataProvider/data_provider.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/dropdown_container.dart';
import 'package:totem_boschetto/views/home_page/forest/forest_tree.dart';

const Color secondaryColor = Color.fromRGBO(186, 250, 137, 1);

///This padding set distance of dropdown details box by right side of screen
const double leftOffsetInfoMenu = 30.0;

class HomePage extends StatefulWidget {
  final DataProvider dataProvider;
  const HomePage({super.key, required this.dataProvider});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showDetails;
  SharedData? userData;

  @override
  void initState() {
    super.initState();
    showDetails = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(236, 255, 221, 1),
      child: Center(
        child: Stack(children: [
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: FutureBuilder<List<SharedData>>(
                future: widget.dataProvider.getTotemData(totemId: "ces_remade"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    log("Data: " + snapshot.data!.toString());
                    return GridView.count(
                      crossAxisCount: 20,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: (snapshot.data ?? []).map(
                        (userDataTree) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                userData = userDataTree;
                                showDetails = !showDetails;
                              });
                            },
                            child:
                                ForestTree(level: userDataTree.level.round()),
                          );
                        },
                      ).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )),
          Padding(
            padding: const EdgeInsets.only(right: leftOffsetInfoMenu),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownContainer(
                      userData: userData,
                      showDetails: showDetails,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
