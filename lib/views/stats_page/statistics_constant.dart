import 'package:flutter/material.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/views/stats_page.dart';

// COLORS
const treeColor = Color.fromRGBO(73, 166, 31, 1);
const projColor = Color.fromRGBO(234, 156, 98, 1);
const co2Color = Color.fromRGBO(105, 93, 105, 1);
const paperColor = Color.fromRGBO(181, 206, 255, 1);
const awarenessColor = Color.fromRGBO(254, 210, 164, 1);
const ePowerColor = Color.fromRGBO(240, 197, 27, 1);
const fuelColor = Color.fromRGBO(0, 0, 0, 1);

// ICONS
final treeIcon = Image.asset("${statIconPath}forest.png");
final projIcon = Image.asset("${statIconPath}project.png");
final co2Icon = Image.asset("${statIconPath}co2.png");
final paperIcon = Image.asset("${statIconPath}paper.png");
final awarenessIcon = Image.asset("${statIconPath}awareness.png");
final ePowerIcon = Image.asset("${statIconPath}idea.png");
final fuelIcon = Image.asset("${statIconPath}fuel.png");

// LABELS
const treeLabel = 'ALBERI PIANTATI';
const projLabel = 'PROGETTI COINVOLTI';
const co2Label = 'CO2 EVITATA';
const paperLabel = 'CARTA RISPARMIATA';
const awarenessLabel = 'CONSAPEVOLEZZA';
const ePowerLabel = "ENERGIA ELETTRICA";
const fuelLabel = "BENZINA";

// DESCRIPTIONS
const treeDescr = 'Numero di alberi piantati dagli utenti nel bsoco virtuale.';
const projDescr =
    'Quantità di progetti e attività coinvolti nel processo di dematerializzazione.';
const co2Descr = '$co2String assorbita dagli alberi del bosco virtuale.';
const paperDescr =
    'Quantità di fogli di carta in formato A4 che corrispondenti alla $co2String assorbita dagli alberi del bosco virtuale.';
const awarenessDescr =
    'Consapevolezza generale sul tema della dematerializzazione e sul risparmio di carta.';
const ePowerDescr =
    'Energia elettrica espressa in Kilowattora equivalente alla qunatità di $co2String assorbita dagli alberi del bosco virtuale.';

const fuelDescr =
    'Benzina ricavabile dalla $co2String assorbita dal bosco virtuale.';

enum StatId {
  ePower,
  co2,
  paper,
  tree,
  proj,
  aware,
  fuel,
}
