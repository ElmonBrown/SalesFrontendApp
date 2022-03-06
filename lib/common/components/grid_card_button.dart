
import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class GridCardButton extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;

  const GridCardButton({Key? key, required this.onTap, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8,),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0 , left: 10.0, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.image,
                size: 160,
                color: AppColors.primarySwatch,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'short detail',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
          /*    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'RD$ ' +
                    product.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ItemCantWidgetS(item: new Item(code: product.code, price: product.price, name: product.name))
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
