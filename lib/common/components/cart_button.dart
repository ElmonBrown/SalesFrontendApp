import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/sopping_cart_page.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => _goToShoppingCart(context),
            icon: Icon(Icons.shopping_cart)),
        Transform(
          transform: new Matrix4.identity()..scale(0.6),
          alignment: Alignment.bottomRight,
          child: Chip(
            backgroundColor: const Color(0xFFa3bdc4),
            label: Text(
              '25', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
