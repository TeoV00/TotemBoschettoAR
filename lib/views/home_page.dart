import 'package:flutter/material.dart';
import 'home_page/details_box.dart';

const secondaryColor = Color.fromRGBO(186, 250, 137, 1);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showDetails = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(236, 255, 221, 1),
      child: Center(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DetailsBox(
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
