import 'package:flutter/material.dart';

const double iconSize = 160;
const double qrcodeSize = 100;

Widget hiddenCode = Image.asset(
  "/icons/push-data-icon.png",
  height: iconSize,
  alignment: Alignment.bottomCenter,
);

Widget showingCode = Stack(
  alignment: Alignment.center,
  children: [
    Image.asset(
      "/icons/empty-vase.png",
      height: iconSize,
      alignment: Alignment.bottomCenter,
    ),
    Image.asset(
      "/icons/demo-qr.png",
      height: qrcodeSize,
      alignment: Alignment.bottomCenter,
    ),
  ],
);

class QrCodeNavSection extends StatefulWidget {
  const QrCodeNavSection({super.key});

  @override
  State<QrCodeNavSection> createState() => _QrCodeNavSectionState();
}

class _QrCodeNavSectionState extends State<QrCodeNavSection> {
  bool _showQr = false;
  Widget _currentIcon = hiddenCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => _updateQrIcon(),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) =>
                  ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: _currentIcon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              _showQr
                  ? "Apri l’app, vai nel profilo e scansiona il qr"
                  : "Deposita progressi APP",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  void _updateQrIcon() {
    setState(() {
      _showQr = !_showQr;
      _currentIcon = _showQr ? showingCode : hiddenCode;
    });
  }
}
