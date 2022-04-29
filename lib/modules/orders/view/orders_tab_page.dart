import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/extensions/date_time_extensions.dart';
import 'package:multiquimica_store_app/common/extensions/int_extensions.dart';
import 'package:multiquimica_store_app/modules/orders/models/order.dart';
import 'package:multiquimica_store_app/modules/orders/serivices/orders_service.dart';
import 'package:multiquimica_store_app/modules/orders/view/order_datail_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class OrdersTabPage extends StatelessWidget {
  OrdersTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: AppColors.primarySwatch,
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'All',),
                Tab(text: 'Pending'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          Expanded(
            child: _buildOrdersList()
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(){
    return FutureBuilder<List<Order>?>(
      future: _getOrders(),
      builder: (context, snapshot) {
        if(snapshot.hasData  && snapshot.data != null)
        return ListView.separated(
            itemCount: snapshot.data!.length,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            separatorBuilder: (BuildContext context, int index)=> Divider( thickness: 2,),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Icon(Icons.arrow_forward_ios, size: 14,),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order #' + (snapshot.data![index].invoice?.codeSap ?? '000000'),),
                    Text(snapshot.data![index].create?.toFormattedString() ?? '01/01/2022', style: TextStyle(fontSize: 14),),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status: In Process', style: TextStyle(color: Colors.green),),
                    Text('RD ${snapshot.data![index].itemAmount?.toFormattedString() ?? '0.00'}'),
                  ],
                ),
                onTap: () => _goToDetail(context,snapshot.data![index].id! ),
              );
            });
        return Center(
          child: Text(
            'No se encontraron Registros',
          ),
        );
      }
    );
  }

  Widget _buildMockOrderList(){
    return ListView.separated(
        itemCount: 20,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        separatorBuilder: (BuildContext context, int index)=> Divider( thickness: 2,),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Icon(Icons.arrow_forward_ios, size: 14,),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #000000' + index.toString(),),
                Text('01/01/2022', style: TextStyle(fontSize: 14),),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status: Delivered', style: TextStyle(color: Colors.green),),
                Text('RD 1,000'),
              ],
            ),
            onTap: () => _goToDetail(context, ''),
          );
        });
  }
  Future<List<Order>?> _getOrders() async {
    OrdersService service = new OrdersService();
    return await service.getOrders();
  }

  _goToDetail(BuildContext context, String orderCode){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OrderDetailPage(orderCode:orderCode)));
  }
}
