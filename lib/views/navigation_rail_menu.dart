import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/qrcode_nav_section.dart';

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
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var navRailWidth = screenSize.width * 0.2;
    var emptyLeadingSpace = screenSize.height * 0.2;
    return Row(
      children: [
        NavigationRail(
          leading: SizedBox(height: emptyLeadingSpace),
          trailing: Expanded(
            child: Column(
              children: const [
                Spacer(),
                QrCodeNavSection(),
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(161, 204, 130, 1),
          extended: true,
          minExtendedWidth: navRailWidth,
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
        const VerticalDivider(thickness: 1, width: 1),
        Center(
          child: destinations.values.elementAt(_selectedIndex),
        )
      ],
    );
  }
}
