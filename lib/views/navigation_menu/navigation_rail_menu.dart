import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/dataProvider/data_manager.dart';
import 'package:totem_boschetto/views/home_page.dart';
import 'package:totem_boschetto/views/info_page.dart';
import 'package:totem_boschetto/views/navigation_menu/qrcode_nav_section.dart';
import 'package:totem_boschetto/views/stats_page.dart';

/// Text style for selected item in navigation rail
const selectedTextStyle = TextStyle(
  color: Colors.white,
  decoration: TextDecoration.underline,
  decorationThickness: 2,
  fontSize: 36,
  fontWeight: FontWeight.w900,
);

/// Text style for unselected item in navigation rail
const unselectedTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

NavigationRailDestination noIconDestinationRail(String label) {
  return NavigationRailDestination(
    icon: const SizedBox(width: 0),
    selectedIcon: const SizedBox(width: 0),
    label: Text(label),
  );
}

class NavRailMenu extends StatefulWidget {
  final DataManager dataManager;

  const NavRailMenu({super.key, required this.dataManager});

  @override
  State<NavRailMenu> createState() => _NavRailMenuState();
}

class _NavRailMenuState extends State<NavRailMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var navRailWidth = 320.0; //screenSize.width * 0.25;
    var emptyLeadingSpace = screenSize.height * 0.2;

    Map<NavigationRailDestination, Widget> destinations = {
      noIconDestinationRail("Home"): HomePage(dataManager: widget.dataManager),
      noIconDestinationRail("Statistiche"):
          StatisticPage(dataManager: widget.dataManager),
      noIconDestinationRail("Classifica Utenti"):
          const Text("Schermata classifica"),
      noIconDestinationRail("Informazioni"): const InfoPage(),
    };

    return Row(
      children: [
        NavigationRail(
          leading: SizedBox(height: emptyLeadingSpace),
          trailing: Expanded(
            child: Column(
              children: [
                const Spacer(),
                QrCodeNavSection(
                    totemId: widget.dataManager.getCurrentTotemId()),
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
        Expanded(
          child: _overlayGrass(destinations.values.elementAt(_selectedIndex)),
        ),
      ],
    );
  }

  /// Overlay a grass image on passed widget;
  /// Grass image is aligned to bottom
  Widget _overlayGrass(Widget widget) {
    return Stack(
      children: [
        widget,
        Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              "images/grass.svg",
              height: 60,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
          ],
        )
      ],
    );
  }
}
