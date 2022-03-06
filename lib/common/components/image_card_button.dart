import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

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
        child: Column(
          children: [
            Image.asset(assetName),
            Expanded(
              child: Center(
                child: Text(
                  text, style: TextStyle(fontSize: 14, color: AppColors.primarySwatch, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
