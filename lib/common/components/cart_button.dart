import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/streams/cart_items_bloc.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/sopping_cart_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class CartButton extends StatelessWidget {
  CartButton({Key? key}) : super(key: key);

  final CartItemsBloc _cartBloc = CartItemsBloc();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => _goToShoppingCart(context),
            icon: Icon(Icons.shopping_cart,)),
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 0),
          child: Transform(
            transform: new Matrix4.identity()..scale(0.5),
            alignment: Alignment.topRight,
            child: Chip(
              backgroundColor: Colors.white,
              label: StreamBuilder<List<Item>>(
                stream: _cartBloc.allItemsStream,
                initialData: _cartBloc.items,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data?.fold(0, (int previousValue, item) => previousValue + item.cant).toString() ?? "0", style: TextStyle(fontSize: 18, color: AppColors.primarySwatch, fontWeight: FontWeight.bold),
                  );
                }
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _goToShoppingCart(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ShoppingCartPage()));
  }
}
