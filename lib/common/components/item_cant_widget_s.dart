import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/streams/cart_items_bloc.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class ItemCantWidgetS extends StatelessWidget {
  final Item? item;

  ItemCantWidgetS({Key? key, this.item}) : super(key: key);

  final CartItemsBloc _cartBloc = CartItemsBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Item>>(
        stream: _cartBloc.allItemsStream,
        builder: (context, snapshot) {
          int _cant = _cartBloc.getItemCant(item!.code);
          if (_cant == 0)
            return _buildIncreaseButton(_cant);
          else
            return SizedBox(
              height: 50,
              width: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDecreaseButton(_cant),
                  Expanded(child: _buildCantLabel(_cant)),
                  _buildIncreaseButton(_cant),
                ],
              ),
            );
        });
  }

  Widget _buildDecreaseButton(int cant) {
    return IconButton(
      icon: Icon(
        cant == 1 ? Icons.delete_sharp : Icons.indeterminate_check_box,
        size: 30,
        color: AppColors.primarySwatch,
      ),
      onPressed: _decreaseCant,
    );
  }

  Widget _buildIncreaseButton(int cant) {
    return IconButton(
      icon: Icon(
        cant > 0 ? Icons.add_box_rounded : Icons.add_circle,
        size: 30,
        color: AppColors.primarySwatch,
      ),
      onPressed: _increaseCant,
    );
  }

  Widget _buildCantLabel(int cant) {
    return Text(
      cant.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primarySwatch,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }

  void _increaseCant() {
    if (item != null) _cartBloc.add(item!);
  }

  void _decreaseCant() {
    if (item != null) _cartBloc.remove(item!.code);
  }
}
