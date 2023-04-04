import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/home_page/dropdown_container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(236, 255, 221, 1),
      child: Center(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: leftOffsetInfoMenu),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //TODO: put here woods
                    DropdownContainer(
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
