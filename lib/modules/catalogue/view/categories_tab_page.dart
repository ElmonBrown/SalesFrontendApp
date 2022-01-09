import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/components/image_card_button.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/products_page.dart';

class CategoriesTabPage extends StatelessWidget {
  CategoriesTabPage({Key? key}) : super(key: key);

  final List<String> assetNames = <String>[
    'assets/images/product_categories/industrial.jpg',
    'assets/images/product_categories/pinturas.jpg',
    'assets/images/product_categories/plasticos.jpg',
    'assets/images/product_categories/construccion.jpg',
    'assets/images/product_categories/ferreteria.jpg',
    'assets/images/product_categories/agricultura.jpg',
  ];

  final List<String> categoryNames = <String>[
    'INDUSTRIAL & PYMES',
    'PINTURAS & ADHESIVOS',
    'PLASTICOS',
    'CONSTRUCCION',
    'FERRETERIA',
    'AGRICULTURA & PECUARIA',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageCardButton(
              onTap: () => _goToProducts(context, '0' + (index +1).toString()),
              assetName: assetNames[index],
              text: categoryNames[index],
            ),
          );
        });
  }

  static void _goToProducts (BuildContext context, String idCategory){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsPage(idCategory: idCategory)));
  }
}
