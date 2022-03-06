import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/sopping_cart_page.dart';

import 'cart_button.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar({required BuildContext context, required String text, PreferredSizeWidget? bottomBar, double? toolbarHeight}) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      elevation: 0,
      leading: IconButton(icon:Icon(Icons.account_circle,), iconSize: 36, onPressed:  ()=> Scaffold.of(context).openDrawer() ,),
      actions: [
        CartButton()
      ],
      bottom: bottomBar,
    );
  }


  static void _goToCategories (BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoppingCartPage()));
  }
}
