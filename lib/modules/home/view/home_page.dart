import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/components/app_bars.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/category.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/products_page.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/categories_page.dart';

class HomePage extends StatelessWidget {
  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.mainAppBar(context: context, text: AppLocalizations.of(context)!.catalogue),
      body: _buildTab(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store),label: AppLocalizations.of(context)!.catalogue),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: AppLocalizations.of(context)!.history),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: AppLocalizations.of(context)!.cart),
        ],) ,
    );
  }

  Widget _buildTab()
  {
    return new CategoriesPage();
  }
}
