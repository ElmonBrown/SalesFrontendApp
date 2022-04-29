import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/extensions/date_time_extensions.dart';
import 'package:multiquimica_store_app/common/extensions/int_extensions.dart';
import 'package:multiquimica_store_app/common/models/item.dart';
import 'package:multiquimica_store_app/modules/orders/models/order.dart';
import 'package:multiquimica_store_app/modules/orders/serivices/orders_service.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderCode;
  final OrdersService _catalogService = new OrdersService();
  OrderDetailPage({Key? key, required this.orderCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de la orden'),),
      body: FutureBuilder<Order?>(
        future: _catalogService.getOrderDetail(orderCode),
        builder: (context, snapshot) {
          if(snapshot.hasData  && snapshot.data != null)
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            margin: EdgeInsets.all(16),
              child: Center(child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text('Número de la orden: ' + (snapshot.data!.invoice?.codeSap ?? '000000'), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
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
                  Column(
                    children: _buildProductsList(snapshot.data!.items!),
                  ),

                  Divider(),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub-Total: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                      Text(r'RD$ ' + (snapshot.data!.itemAmount?.toFormattedString() ?? '0.00'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
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
                      Text(r'RD$ 0.00', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
                      Text(r'RD$ ' + (snapshot.data!.itemAmount?.toFormattedString() ?? '0.00'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primarySwatch),),
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
                  Text(snapshot.data!.prefereDelivery?.toFormattedString() ?? '01/01/2022', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,),),
                ],
              ),));
          return Center(
            child: Text(
              'No se encontraron datos',
            ),
          );
        }
      ),
    );
  }

  List<Widget> _buildProductsList(List<Item> itemsList){
    List<Widget> products = <Widget>[];

    itemsList.forEach((item) {
      products.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.quantity.toString() + '        '+ (item.material?.name ?? 'Producto #'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
              Text(r'RD$ ' + item.price!.toFormattedString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),),
            ],
          )
      );

      products.add(
        SizedBox(height: 4,),
      );
    });
    return products;
  }

  List<Widget> _buildProductsListMock(){
    return <Widget>[
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
    ];
  }
}
