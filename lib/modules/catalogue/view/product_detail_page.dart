import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/components/presentation_picker.dart';
import 'package:multiquimica_store_app/common/extensions/string_extensions.dart';
import 'package:multiquimica_store_app/common/streams/cart_items_bloc.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/modules/catalogue/services/catalogue_service.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/view/sopping_cart_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final CatalogueService _catalogService = new CatalogueService();

  final CartItemsBloc _cartBloc = CartItemsBloc();

  late TextEditingController _controller;

  bool _isFormActive = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: FutureBuilder<Product?>(
          future: _catalogService.getProductDetail(widget.product.code),
          initialData: widget.product,
          builder: (context, snapshot) {
            Product p = snapshot.data != null ? snapshot.data! : widget.product;
            return Center(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primarySwatch,
                            border: Border(
                                bottom: BorderSide(color: Colors.transparent))),
                        padding: EdgeInsets.only(bottom: 80),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Icon(
                                Icons.image,
                                size: 250,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Text(
                                p.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Text(
                                'short detail',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(p.description ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       //presentation picker
                        PresentationPicker(presentations: p.presentations,),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            enabled: _isFormActive,
                            controller: _controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Cantidad',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isFormActive ? _onAddItem : (){},
                        child: Text('Agregar al Carrito'),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  )
                  /* Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'RD$ '+
                        product.price.toString(),
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
                      ),
                      ItemCantWidgetS(
                        item: new Item(
                            code: product.code, price: product.price, name: product.name),
                      ),
                    ],
                  ),
                ),*/
                ],
              ),
            );
          }),
    );
  }

  Future<void> _onAddItem() async {
    //_cartBloc.addNew("5Mat", "2", 1);
    _disableForm();
    int cant= _controller.text.toInt();
    await _cartBloc.addNew(widget.product.code, "2", cant > 0 ? cant: 1);
    _goToShoppingCart(context);
  }
  void _goToShoppingCart(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ShoppingCartPage()));
  }

  void _enableForm() {
    setState(() {
      _isFormActive = true;
    });
  }

  void _disableForm() {
    setState(() {
      _isFormActive = false;
    });
  }

  final String _description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}
