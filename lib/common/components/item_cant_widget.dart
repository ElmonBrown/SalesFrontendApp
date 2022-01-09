import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class ItemCantWidget extends StatefulWidget {
  final int cant;
  const ItemCantWidget({Key? key, this.cant: 0}) : super(key: key);

  @override
  _ItemCantWidgetState createState() => _ItemCantWidgetState();
}

class _ItemCantWidgetState extends State<ItemCantWidget> {
  int _cant = 0;

  @override
  void initState() {
    super.initState();

    _cant = widget.cant;
  }

  @override
  Widget build(BuildContext context) {
    if (_cant == 0)
      return IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          size: 36,
          color: AppColors.primarySwatch,
        ),
        onPressed: _increaseCant,
      );
    else
      return SizedBox(
        height: 50,
        width: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDecreaseButton(),
            _buildCantLabel(),
            _buildIncreaseButton(),
          ],
        ),
      );
  }

  Widget _buildDecreaseButton(){
    return IconButton(
      icon: Icon(
        Icons.remove_circle_outline,
        size: 36,
        color: AppColors.primarySwatch,
      ),
      onPressed: _decreaseCant,
    );
  }

  Widget _buildIncreaseButton(){
    return IconButton(
      icon: Icon(
        Icons.add_circle_outline,
        size: 36,
        color: AppColors.primarySwatch,
      ),
      onPressed: _increaseCant,
    );
  }

  Widget _buildCantLabel(){
    return Text(_cant.toString());
  }

  void _increaseCant() {
    setState(() {
      _cant++;
    });
  }

  void _decreaseCant() {
    setState(() {
      _cant--;
    });
  }
}
