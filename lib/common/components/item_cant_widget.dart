import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/streams/cart_items_bloc.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class ItemCantWidget extends StatefulWidget {
  final int cant;
  final Item? item;
  const ItemCantWidget({Key? key, this.cant: 0, this.item}) : super(key: key);

  @override
  _ItemCantWidgetState createState() => _ItemCantWidgetState();
}

class _ItemCantWidgetState extends State<ItemCantWidget> {
  int _cant = 0;
  final CartItemsBloc cartBloc = CartItemsBloc();
  @override
  void initState() {
    super.initState();
    _cant = widget.item != null && widget.cant == 0 ? cartBloc.getItemCant(widget.item!.code) : widget.cant;
  }

  @override
  Widget build(BuildContext context) {
    if (_cant == 0)
      return _buildIncreaseButton();
    else
      return SizedBox(
        height: 50,
        width: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDecreaseButton(),
            Expanded(child: _buildCantLabel()),
            _buildIncreaseButton(),
          ],
        ),
      );
  }

  Widget _buildDecreaseButton(){
    return IconButton(
      icon: Icon(
        _cant == 1 ? Icons.delete_sharp : Icons.indeterminate_check_box,
        size: 36,
        color: AppColors.primarySwatch,
      ),
      onPressed: _decreaseCant,
    );
  }

  Widget _buildIncreaseButton(){
    return IconButton(
      icon: Icon(
        _cant > 0 ? Icons.add_box_rounded : Icons.add_circle,
        size: 36,
        color: AppColors.primarySwatch,
      ),
      onPressed: _increaseCant,
    );
  }

  Widget _buildCantLabel(){
    return Text(_cant.toString(), textAlign: TextAlign.center, style: TextStyle(color: AppColors.primarySwatch, fontWeight: FontWeight.bold, fontSize: 20),);
  }

  void _increaseCant() {
    setState(() {
      if(widget.item != null)
       cartBloc.add(widget.item!);

      //Testing
      //cartBloc.add("00");
      _cant++;
    });
  }

  void _decreaseCant() {
    setState(() {

      if(widget.item != null)
        cartBloc.remove(widget.item!.code);

      //Testing
      //cartBloc.remove("00");
      _cant--;
    });
  }
}
