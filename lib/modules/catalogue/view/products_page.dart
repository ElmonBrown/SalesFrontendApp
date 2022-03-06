import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiquimica_store_app/common/components/cart_button.dart';
import 'package:multiquimica_store_app/common/components/grid_card_button.dart';
import 'package:multiquimica_store_app/common/components/product_tile.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/catalogue/services/catalogue_service.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/product_detail_page.dart';

class ProductsPage extends StatefulWidget {
  final String idCategory;

  const ProductsPage({Key? key, required this.idCategory}) : super(key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<int> items = List.generate(100, (index) => index);

  final CatalogueService _service = new CatalogueService();
  bool showInGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:   Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white70,)),
            Text(AppLocalizations.of(context)!.products, style: TextStyle(color: Colors.white70),),

          ],
        ),
      ),

      actions: [
      IconButton(onPressed: _changeView, icon: Icon( showInGrid ? Icons.view_list_sharp :Icons.view_comfortable_sharp )),

      CartButton(),
    ],
    ),body: _buildProductsList(context));
  }
  void _changeView()
  {
    setState(() {
      showInGrid = !showInGrid;
    });
  }

  Widget _buildProductsList(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _service.getProducts(widget.idCategory),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return showInGrid ?_buildLGridView(context, snapshot.data!): _buildProductListView(context,snapshot.data!);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildLGridView(BuildContext context, List<Product> products){
    return GridView.count(
      padding: EdgeInsets.all(8),
        shrinkWrap: true,
        crossAxisCount: 2,
        // childAspectRatio: 0.6,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 4.0,
        children: _buildGridViewChildren(context, products),
    );
  }

  List<Widget> _buildGridViewChildren(BuildContext context, List<Product> products){
    return products.map((e) => _buildProductGridTile(context,e)).toList();
  }

  Widget _buildProductListView(BuildContext context, List<Product> products){
    return  ListView.separated(
      padding: EdgeInsets.all(8),
              separatorBuilder: (BuildContext context, int index)=> Divider( thickness: 1.5, indent: 15, endIndent: 15,),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) =>
                    _buildProductTile(context, products[index]));

  }

  Widget _buildProductTile( BuildContext context, Product product) {
      return ProductTile(product: product);
  }

  Widget _buildProductGridTile( BuildContext context, Product product) {
    return GridCardButton(product: product, onTap: ()=> _goToProductDetail(context, product));
  }

  void _goToProductDetail(BuildContext context, Product product) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProductDetailPage(product: product,)));
  }
}
