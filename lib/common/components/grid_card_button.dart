
import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/components/item_cant_widget.dart';

class GridCardButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final GestureTapCallback onTap;

  const GridCardButton({Key? key, this.title:'', this.subTitle:'', required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.image,
                size: 60,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              ItemCantWidget()
            ],
          ),
        ),
      ),
    );
  }
}
