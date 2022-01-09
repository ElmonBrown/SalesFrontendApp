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
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Order ' + index.toString()),
                      onTap: () => _goToDetail(context),
                    ),
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
