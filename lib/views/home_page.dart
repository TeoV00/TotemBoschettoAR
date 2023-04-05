import 'package:flutter/material.dart';
import 'package:totem_boschetto/model/user_data.dart';
import 'package:totem_boschetto/views/home_page/dropdown_view/dropdown_container.dart';
import 'package:totem_boschetto/views/home_page/forest/forest_tree.dart';

var firebaseData = <UserData>[
  UserData("Pippo", [1, 5, 8], 5, 200.89, 3),
  UserData("TeoV00", [1, 2, 3, 8], 1, 85.00, 5),
  UserData("michi", [1, 5, 8], 5, 200.89, 4),
  UserData("manu", [1, 2, 3, 8], 1, 85.00, 0),
  UserData("mamma", [1, 5, 8], 5, 200.89, 1),
  UserData("pio", [1, 2, 3, 8], 1, 85.00, 0)
];

const Color secondaryColor = Color.fromRGBO(186, 250, 137, 1);

///This padding set distance of dropdown details box by right side of screen
const double leftOffsetInfoMenu = 30.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showDetails;
  UserData? userData;

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
          GridView.count(
            crossAxisCount: 20,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: firebaseData.map(
              (userDataTree) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      userData = userDataTree;
                      showDetails = !showDetails;
                    });
                  },
                  child: ForestTree(level: userDataTree.userProgress.round()),
                );
              },
            ).toList(),
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
