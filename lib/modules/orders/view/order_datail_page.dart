import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order #00000000'),),
      body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        margin: EdgeInsets.all(16),
          child: Center(child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text('Número de la orden: 00000000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
              SizedBox(height: 8,),
              Text('Resumen de Compra', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),),
              Divider(),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Productos', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                  Text('Precio', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2        Producto 1', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                  Text(r'RD$ 200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1        Producto 2', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                  Text(r'RD$ 200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1        Producto 3', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                  Text(r'RD$ 200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2        Producto 4', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                  Text(r'RD$ 200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
                ],
              ),
              Divider(),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub-Total: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                  Text(r'RD$ 1,200.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Descuento: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                  Text(r'RD$ 0.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Impuesto: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                  Text(r'RD$ 216.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
                  Text(r'RD$ 1,416.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
                ],
              ),
              Divider(),
              SizedBox(height: 32,),
              Text('Cliente', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),),
              SizedBox(height: 8,),
              Text('ClientName', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,),),
              SizedBox(height: 32,),
              Text('Fecha de Entrega', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),),
              SizedBox(height: 8,),
              Text('12 Junio 20022', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,),),
            ],
          ),)),
    );
  }
}
