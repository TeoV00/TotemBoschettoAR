import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem_boschetto/data_manager.dart';
import 'package:totem_boschetto/views/navigation_menu/navigation_rail_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => DataManager(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: Scaffold(
        body: NavRailMenu(dataManager: DataManager()),
      ),
      title: "Totem Boschetto",
    );
  }
}
