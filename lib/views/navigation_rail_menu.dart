import 'package:flutter/material.dart';

const selectedTextStyle = TextStyle(
  color: Colors.white,
  decoration: TextDecoration.underline,
  decorationThickness: 1,
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const unselectedTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

// TODO: create and set pages linked to NavigationRailDestination
Map<NavigationRailDestination, Widget> destinations = {
  noIconDestinationRail("Home"): Text("home page"),
  noIconDestinationRail("Statistiche"): Text("Stats page "),
  noIconDestinationRail("Informazioni"): Text("Info page"),
};

NavigationRailDestination noIconDestinationRail(String label) {
  return NavigationRailDestination(
    icon: const SizedBox(width: 0),
    selectedIcon: const SizedBox(width: 0),
    label: Text(label),
  );
}

class NavRailMenu extends StatefulWidget {
  const NavRailMenu({super.key});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(Object context) {
    return Row(
      children: [
        Container(
          color: const Color.fromRGBO(161, 204, 130, 1),
          child: Column(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: NavigationRail(
                  backgroundColor: Colors.transparent,
                  extended: true,
                  selectedLabelTextStyle: selectedTextStyle,
                  unselectedLabelTextStyle: unselectedTextStyle,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int idx) {
                    setState(() {
                      _selectedIndex = idx;
                    });
                  },
                  destinations: destinations.keys.toList(),
                ),
              ),
              Expanded(
                flex: 1,
                //TODO: put here qr code to scan with mobile app
                child: Container(
                  color: Colors.amber,
                  child: const Text("QRCOde"),
                ),
              )
            ],
          ),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Center(
          child: destinations.values.elementAt(_selectedIndex),
        )
      ],
    );
  }
}
