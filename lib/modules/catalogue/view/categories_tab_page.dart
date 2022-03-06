import 'package:flutter/material.dart';
import 'package:multiquimica_store_app/common/components/app_bars.dart';
import 'package:multiquimica_store_app/common/components/image_card_button.dart';
import 'package:multiquimica_store_app/modules/catalogue/view/products_page.dart';
import 'package:multiquimica_store_app/settings/app_colors.dart';
import 'package:multiquimica_store_app/settings/app_strings.dart';

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
    return  _buildNewView(context);
  }

  Widget _buildNewView(BuildContext context){
    return ListView(
        children: [
          AppBars.mainAppBar(context: context, text: AppStrings.appName),
          _buildHeaderBanner(), _buildGrid(context)
        ]
            
    );
  }

  Widget _buildSliverView(BuildContext context){
    return CustomScrollView(
        slivers: [
          const SliverAppBar(
            // Provide a standard title.
            title: Text('klk'),
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            // Make the initial height of the SliverAppBar larger than normal.
          ),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
                  (context, index) => ListTile(title: Text('Item #$index')),
              // Builds 1000 ListTiles
              childCount: 1000,
            ),
          ),
        ]

    );
  }

  Widget _buildIllu(BuildContext context){
    List<Widget> list =  [];

    list.add(Container(color:AppColors.primarySwatch, width: double.infinity,height: 80,),);

    list.add(Column(children: _categories(context),));

    return Stack(
        children: list
    );
  }

  Widget _buildGrid(BuildContext context){
    List<Widget> list =  [];

    list.add(Container(color:AppColors.primarySwatch, width: double.infinity,height: 80,),);

    list.add(GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2, children: _categories(context),
      childAspectRatio: 1.15,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 4.0,
    ),
    );

    return Stack(
        children: list
    );
  }

  List<Widget> _categories(BuildContext context){
    return List.generate(6, (index) {
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
  Widget _buildOldView(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       _buildHeaderBanner(),
        Expanded(
          child: _buildIllusion(),
        ),
      ],
    );
  }
  Widget _buildHeaderBanner(){
    return  Container(
      //padding: EdgeInsets.only(left: 8),
      alignment: Alignment.topLeft,
      height: 80,width: double.infinity,color: AppColors.primarySwatch,
      child: Center(child: Image.asset("assets/images/logo_transparente.png", width: 300,)),
    );
  }
  
 Widget _buildIllusion(){
    return Stack(
      children: [
        Container(color:AppColors.primarySwatch, width: double.infinity,height: 80,),
        ListView.builder(
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
            }),
      ],
    );
  }
  static void _goToProducts (BuildContext context, String idCategory){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsPage(idCategory: idCategory)));
  }
}
