import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/categories_page.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/sopping_cart_page.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar({required BuildContext context, required String text, PreferredSizeWidget? bottomBar}) {
    return AppBar(
      title: Text(text),
      actions: [
        IconButton(onPressed: () => _goToShoppingCart(context), icon: Icon(Icons.shopping_cart_outlined))
      ],
      bottom: bottomBar,
    );
  }

  static void _goToShoppingCart (BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoppingCartPage()));
  }

  static void _goToCategories (BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoppingCartPage()));
  }
}
