import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            child: ListView.separated(
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
                      onTap: () => _goToDetail(context),
                    );
                }),
          ),
        ],
      ),
    );
  }

  _goToDetail(BuildContext context){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OrderDetailPage()));
  }
}
