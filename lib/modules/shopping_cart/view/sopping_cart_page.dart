import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/product_tile.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.cart)),
        actions: [
          Chip(
            label: Text('25'),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: _buildProductListView(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildProductListView() {
    return ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) => ProductTile(
            product: new Product(
                code: '00',
                name: 'Product ' + index.toString(),
                price: 200,
                cant: 1)));
  }

  Widget _buildBottomBar() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Total: 5.700'),
          ElevatedButton(onPressed: null, child: Text('Realizar Pedido'))
        ],
      ),
    );
  }
}
