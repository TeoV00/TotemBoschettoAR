import 'package:flutter/material.dart';
import 'package:totem_boschetto/model/user_data.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/dropdown_container.dart';
import 'package:totem_boschetto/views/home_page/forest/forest_tree.dart';

const Color secondaryColor = Color.fromRGBO(186, 250, 137, 1);

///This padding set distance of dropdown details box by right side of screen
const double leftOffsetInfoMenu = 30.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showDetails = false;
  UserData? userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(236, 255, 221, 1),
      child: Center(
        child: Stack(children: [
          GridView.count(
            crossAxisCount: 20,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              /*
              TODO: create widget that rapresent tree of wood the
              register gesture to open Dropdown details with selected one data
              */
              GestureDetector(
                onTap: () {
                  debugPrint("pemuto");
                  setState(() {
                    showDetails = !showDetails;
                  });
                  debugPrint("$showDetails");
                },
                child: const ForestTree(),
              )
            ],
          ),
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
