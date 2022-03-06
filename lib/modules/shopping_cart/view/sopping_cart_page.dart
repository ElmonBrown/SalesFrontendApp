import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/product_tile.dart';
import 'package:multiquimica_store_app/common/components/yes_no_dialog.dart';
import 'package:multiquimica_store_app/common/extensions/double_extensions.dart';
import 'package:multiquimica_store_app/common/streams/cart_items_bloc.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/checkout_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final CartItemsBloc _cartBloc = CartItemsBloc();

  bool isQuoted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.cart)),
        actions: [
          Chip(
              backgroundColor: Colors.white,
              label: StreamBuilder(
                stream: _cartBloc.allItemsStream,
                builder: (context, snapshot) {
                  return Text(
                    _cartBloc.getSumCant().toString(),
                    style: TextStyle(
                        color: AppColors.primarySwatch,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  );
                },
              )),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _showClearConfirmDialog(context),
          )
        ],
      ),
      body: _buildProductListView(),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildProductListView() {
    if (_cartBloc.items.length > 0)
      return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: _cartBloc.items.length,
          itemBuilder: (BuildContext context, int index) => ProductTile(
              showCant: true,
              product: new Product(
                  code: _cartBloc.items[index].code,
                  name: _cartBloc.items[index].name,
                  price: _cartBloc.items[index].price,
                  cant: _cartBloc.items[index].cant)));
    else
      return Center(
        child: (Text('The cart is Empty')),
      );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.5, color: AppColors.primarySwatch))),
      child: SizedBox(
        height: 50,
        child: StreamBuilder<Object>(
            stream: _cartBloc.allItemsStream,
            builder: (context, snapshot) {
              double _total = _cartBloc.getTotal();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total:     ' + _total.toFormattedString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      onPressed:
                          _total > 0 ? () => _goToCheckOut(context) : null,
                      child: Text(isQuoted? 'Realizar Pedido' : 'Cotizar'))
                ],
              );
            }),
      ),
    );
  }

  void _goToCheckOut(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CheckoutPage()));
  }

  void _quote(BuildContext context) {

  }

  _showClearConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return YesNoDialog(
            title: 'Do you want to empty the cart?',
            onOkTap: _clearCart,
          );
        });
  }

  void _clearCart() {
    setState(() {
      _cartBloc.removeAll();
    });
  }
}
