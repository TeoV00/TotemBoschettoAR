import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/stats_page.dart';

// COLORS
const treeColor = Color.fromRGBO(73, 166, 31, 1);
const projColor = Color.fromRGBO(234, 156, 98, 1);
const co2Color = Color.fromRGBO(105, 93, 105, 1);
const paperColor = Color.fromRGBO(181, 206, 255, 1);
const awarenessColor = Color.fromRGBO(254, 210, 164, 1);

// ICONS
final treeIcon = Image.asset("${statIconPath}forest.png");
final projIcon = Image.asset("${statIconPath}project.png");
final co2Icon = Image.asset("${statIconPath}co2.png");
final paperIcon = Image.asset("${statIconPath}paper.png");
final awarenessIcon = Image.asset("${statIconPath}awareness.png");

// LABELS
const treeLabel = 'ALBERI PIANTATI';
const projLabel = 'PROGETTI COINVOLTI';
const co2Label = 'CO2 EVITATA';
const paperLabel = 'CARTA RISPARMIATA';
const awarenessLabel = 'CONSAPEVOLEZZA';

// DESCRIPTIONS
const treeDescr = 'Numero di alberi virtuali piantati dagli utenti';
const projDescr =
    'Quantità di progetti e attività coinvolte nel processo di dematerializzazione. ';
const co2Descr = '$co2String assorbita dagli alberi del bosco virtuale.';
const paperDescr =
    'Quantità di fogli di carta in formato A4 risparmiati se il bosco virtuale fosse un bosco vero.';
const awarenessDescr =
    'Consapevolezza generale sul tema della dematerializzazione e sul risparmio di carta.';
