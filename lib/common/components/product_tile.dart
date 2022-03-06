import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/extensions/int_extensions.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/product_detail_page.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

import 'item_cant_widget_s.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final bool showCant;
  const ProductTile({Key? key, required this.product, this.showCant: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Icons.image,
          size: 50,
          color: AppColors.primarySwatch,
        ),
        title: Text(
          product.name,
        ),
        subtitle: Text(AppLocalizations.of(context)!.price + ": " + product.price.toFormattedString()) ,
        trailing: showCant? ItemCantWidgetS(item: new Item(code: product.code, price: product.price, name: product.name),) : null,
        onTap: ()=> _goToProductDetail(context));
  }

  void _goToProductDetail(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProductDetailPage(product: product,)));
  }
}
