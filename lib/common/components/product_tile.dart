import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/product_detail_page.dart';

import 'item_cant_widget.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 40),
        leading: Icon(
          Icons.image,
          size: 60,
          color: Colors.blueGrey,
        ),
        title: Text(
          product.name,
        ),
        subtitle: Text(AppLocalizations.of(context)!.price + ": " + product.price.toString()) ,
        trailing: ItemCantWidget(cant: product.cant),
        onTap: ()=> _goToProductDetail(context));
  }

  void _goToProductDetail(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProductDetailPage()));
  }
}
