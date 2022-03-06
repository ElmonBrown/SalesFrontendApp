import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          ListTile(
              title: Text(
            'Resumen de Orden',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Divider(),
          ListTile(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subt-total:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                r'RD$ 1,200.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          )),
          Divider(),
          ListTile(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Descuento:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                r'RD$ 0.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          )),
          Divider(),
          ListTile(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Impuesto:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                r'RD$ 216.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          )),
          Divider(),
          ListTile(
              title: Container(
            padding: EdgeInsets.all(8),
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  r'RD$ 1,416.00',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )),
          Divider(),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios, size: 14,color: AppColors.primarySwatch),
            title: Text(
              'Ver Carrito',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primarySwatch),
            ),
            onTap: () {},
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.primarySwatch),
            title: Text(
              'Seleccionar Método de pago',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primarySwatch),
            ),
            onTap: () {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Pagar'),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
