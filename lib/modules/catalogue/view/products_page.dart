import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/grid_card_button.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/catalogue/services/sales_services.dart';

class ProductsPage extends StatefulWidget {
  final String idCategory;

  const ProductsPage({Key? key, required this.idCategory}) : super(key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<int> items = List.generate(100, (index) => index);

  final SalesService _service = new SalesService();
  bool showInGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Products'),actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: _changeView, icon: Icon( showInGrid ? Icons.view_list_sharp :Icons.view_comfortable_sharp )),
    ],),body: showInGrid ?_buildLGridView(context): _buildListView(context));
  }
  void _changeView()
  {
    setState(() {
      showInGrid = !showInGrid;
    });
  }

  Widget _buildLGridView(BuildContext context){
    return GridView.count(
      padding: EdgeInsets.all(8),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 4.0,
        children: _buildGridViewChildren(context),
    );
  }

  List<Widget> _buildGridViewChildren(BuildContext context){
    return items.map((e) => _buildProductGrid(context,Product(code: e.toString(), name: 'Product '+ e.toString()))).toList();
  }

  Widget _buildListView(BuildContext context){
    return FutureBuilder<List<Product>>(
      future: _service.getProducts(widget.idCategory),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) =>
                    _buildProductTile(context, snapshot.data[index]));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildProductTile( BuildContext context, Product product) {
      return ListTile(
          contentPadding: EdgeInsets.only(left: 20, right: 40),
          leading: Icon(
            Icons.image,
            size: 60,
            color: Colors.blueGrey,
          ),
          title: Text(
            product.name,
          ),
          subtitle: Text(AppLocalizations.of(context)!.price + ": " + product.price.toString()) ,
          trailing: Icon(
            Icons.add_circle_outline,
            size: 40,
            color: Colors.red,
          ),
          onTap: () {});
  }

  Widget _buildProductGrid( BuildContext context, Product product) {
    return GridCardButton(title: product.name,subTitle: product.price.toString(),onTap: (){});
  }
}
