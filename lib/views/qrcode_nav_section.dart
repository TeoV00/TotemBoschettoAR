import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/common/resizing_icon.dart';

const double iconSize = 160;
const double qrcodeSize = 100;

class QrCodeNavSection extends StatefulWidget {
  const QrCodeNavSection({super.key});

  @override
  State<QrCodeNavSection> createState() => _QrCodeNavSectionState();
}

class _QrCodeNavSectionState extends State<QrCodeNavSection> {
  bool _showQr = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => _updateQrIcon(),
            child: ScanQRIcon(showQR: _showQr),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 320,
              height: 50,
              child: Text(
                _showQr
                    ? "Apri l’app, vai nel profilo e scansiona il qr"
                    : "Deposita progressi APP",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _updateQrIcon() {
    setState(() {
      _showQr = !_showQr;
    });
  }
}

class ScanQRIcon extends StatelessWidget {
  final bool showQR;

  const ScanQRIcon({super.key, required this.showQR});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ResizingIcon(
          icon: Image.asset("/icons/empty-vase.png"),
          transition: showQR,
          mainIconSize: iconSize * 0.6, //initial size
          secondaryIconSize: iconSize * 1.2, // final size
          iconOffset: 0,
        ),
        ResizingIcon(
          icon: Image.asset("/icons/down-arrow.png"),
          transition: !showQR,
          mainIconSize: 0, //initial size
          secondaryIconSize: 80, // final size
          iconOffset: -1,
        ),
        ResizingIcon(
          //TODO: set qr code associated to the totem and linked to firebase
          icon: Image.asset("/icons/demo-qr.png"),
          transition: showQR,
          mainIconSize: 0, //initial size
          secondaryIconSize: qrcodeSize * 1.2, // final size
          iconOffset: 0,
        ),
      ],
    );
  }
}
