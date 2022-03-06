import 'package:flutter/material.dart';

class ImageCardButton extends StatelessWidget {
  final String text;
  final String assetName;
  final GestureTapCallback onTap;

  const ImageCardButton(
      {Key? key,
        this.text: 'CATEGORY NAME',
        this.assetName: 'assets/images/product_categories/agricultura.jpg',
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(assetName),
            Positioned.fill(
                child: Align(
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    height: 30,
                    width: double.infinity,
                    color: Colors.white70,
                    child: Text(
                      text, style: TextStyle(fontSize: 18),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ))
          ],
        ),
      ),
    );
  }
}
