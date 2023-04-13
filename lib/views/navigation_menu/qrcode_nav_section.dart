import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem_boschetto/views/common/resizing_icon.dart';

const double iconSize = 160;
const double qrcodeSize = 100;

class QrCodeNavSection extends StatefulWidget {
  final String totemId;

  const QrCodeNavSection({super.key, required this.totemId});

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
            child: ScanQRIcon(showQR: _showQr, totemId: widget.totemId),
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
  final String totemId;
  final Duration duration = const Duration(milliseconds: 200);

  const ScanQRIcon({super.key, required this.showQR, required this.totemId});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ResizingIcon(
          icon: Image.asset("/icons/empty-vase.png"),
          runTransition: showQR,
          mainIconSize: iconSize * 0.6, //initial size
          secondaryIconSize: iconSize * 1.2, // final size
          iconOffset: 0,
          duration: duration,
        ),
        ResizingIcon(
          icon: Image.asset("/icons/down-arrow.png"),
          runTransition: !showQR,
          mainIconSize: 0, //initial size
          secondaryIconSize: 80, // final size
          iconOffset: -1,
          duration: duration,
        ),
        ResizingIcon(
          icon: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.string(
                Barcode.qrCode().toSvg(
                  totemId,
                  width: qrcodeSize * 1.2,
                  height: qrcodeSize * 1.2,
                ),
              ),
            ),
          ),
          runTransition: showQR,
          mainIconSize: 0, //initial size
          secondaryIconSize: qrcodeSize * 1.2, // final size
          iconOffset: 0,
          duration: duration,
        ),
      ],
    );
  }
}
